
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../errors/app_exceptions.dart'; // تأكد من استيراد ملف الـ Exceptions الخاص بك

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  /// الدالة المركزية العامة لمعالجة كافة الطلبات وتحويل البيانات تلقائياً
  Future<T> request<T>({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: (options ?? Options()).copyWith(method: method),
      );

      return fromJson(response.data);
    } on DioException catch (e) {
      // تمرير الخطأ لـ handleDioError المكتوبة سابقاً في ملف الاستثناءات
      throw handleDioError(e); 
    } catch (e) {
      throw UnknownException('خطأ داخلي في معالجة البيانات: $e');
    }
  }
}