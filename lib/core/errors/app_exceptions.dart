// lib/core/errors/app_exceptions.dart

import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String? message]) 
      : super(message ?? 'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة.');
}

class ServerException extends AppException {
  ServerException(String message, [int? statusCode]) : super(message, statusCode);
}

class AuthenticationException extends AppException {
  AuthenticationException(String message, [int? statusCode]) : super(message, statusCode);
}

class ValidationException extends AppException {
  ValidationException(String message) : super(message, 400);
}

class UnknownException extends AppException {
  UnknownException([String? message]) 
      : super(message ?? 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.');
}

// 🌐 دالة لتحويل أخطاء DioException إلى AppException بشكل مركزي
AppException handleDioError(DioException error) {
  final statusCode = error.response?.statusCode;
  final serverData = error.response?.data;
  
  // استخراج رسالة الخطأ القادمة من Supabase إن وجدت
  String? serverMessage;
  if (serverData is Map<String, dynamic>) {
    serverMessage = serverData['msg'] ?? serverData['error_description'] ?? serverData['message'];
  }

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return NetworkException();
      
    case DioExceptionType.badResponse:
      if (statusCode == 401 || statusCode == 403) {
        return AuthenticationException(serverMessage ?? 'انتهت صلاحية الجلسة أو غير مسموح بالدخول.', statusCode);
      } else if (statusCode == 400) {
        // تخصيص رسائل أشهر أخطاء سوبابيس (مثل كلمة المرور القصيرة أو إيميل مسجل مسبقاً)
        if (serverMessage != null && serverMessage.contains('at least 6 characters')) {
          return ValidationException('كلمة المرور يجب أن لا تقل عن 6 أحرف.');
        }
        if (serverMessage != null && serverMessage.contains('already exists')) {
          return ValidationException('هذا البريد الإلكتروني مسجل بالفعل.');
        }
        return ValidationException(serverMessage ?? 'طلب غير صحيح، تأكد من البيانات المدخلة.');
      } else if (statusCode == 404) {
        return ServerException('المورد المطلوبة غير موجود على الخادم (404).', statusCode);
      } else if (statusCode != null && statusCode >= 500) {
        return ServerException('مشكلة في خادم سوبابيس، نعمل على حلها الآن.', statusCode);
      }
      return ServerException(serverMessage ?? 'فشل الاتصال بالسيرفر.', statusCode);
      
    case DioExceptionType.cancel:
      return UnknownException('تم إلغاء الطلب الحلي.');
      
    default:
      return UnknownException();
  }
}