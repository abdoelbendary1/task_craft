// lib/core/network/interceptors/connectivity_interceptor.dart
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';

class ConnectivityInterceptor extends Interceptor {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final results = await _connectivity.checkConnectivity();

    // If there's absolutely no connection, reject the request early
    if (results.contains(ConnectivityResult.none)) {
      NotificationService.show(
        title: 'Offline Mode Active',
        message:
            'Your modifications are cached locally and will sync when internet restores.',
        type: NotificationType.warning,
      );

      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'No active internet network stream detected.',
          type: DioExceptionType.connectionError,
        ),
      );
    }
    return super.onRequest(options, handler);
  }
}
