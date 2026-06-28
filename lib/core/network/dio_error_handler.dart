import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handle(dynamic error, {String? customFallback}) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'انتهت مهلة الاتصال بالخادم. يرجى المحاولة لاحقاً.';
        case DioExceptionType.connectionError:
          return 'لا يوجد اتصال بالإنترنت. تحقق من الشبكة.';
        case DioExceptionType.badResponse:
          return _extractMessageFromResponse(error.response) ??
              customFallback ??
              'حدث خطأ في الخادم (${error.response?.statusCode}).';
        default:
          return customFallback ?? 'حدث خطأ غير متوقع أثناء الاتصال بالشبكة.';
      }
    }
    return 'حدث خطأ غير متوقع.';
  }

  static String? _extractMessageFromResponse(Response? response) {
    if (response?.data == null) return null;
    final data = response!.data;

    if (data is Map<String, dynamic>) {
      // Supabase OAuth/Auth error keys
      if (data.containsKey('error_description'))
        return data['error_description'] as String;
      if (data.containsKey('msg')) return data['msg'] as String;
      if (data.containsKey('message')) return data['message'] as String;
    }
    return null;
  }
}
