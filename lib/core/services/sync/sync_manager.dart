// lib/core/network/sync/sync_manager.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'sync_action.dart';

@lazySingleton
class SyncManager {
  final Box<SyncAction> _queueBox;
  final Dio _dio;
  bool _isSyncing = false;

  SyncManager(this._queueBox, this._dio) {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (!results.contains(ConnectivityResult.none)) {
        flushQueue();
      }
    });
  }

  Future<void> addToActionQueue({
    required String endpoint,
    required String method,
    required Map<String, dynamic> payload,
  }) async {
    final actionId =
        payload['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();

    final action = SyncAction(
      id: actionId,
      endpoint: endpoint,
      method: method,
      payload: payload,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    await _queueBox.put(actionId, action);
  }

  Future<void> flushQueue() async {
    if (_isSyncing || _queueBox.isEmpty) return;
    _isSyncing = true;

    try {
      final actions = _queueBox.values.toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      for (final action in actions) {
        try {
          await _dio.request(
            action.endpoint,
            data: action.payload,
            options: Options(method: action.method),
          );
          await _queueBox.delete(action.id);
        } on DioException catch (e) {
          if (e.type != DioExceptionType.connectionError) {
            continue;
          }
          break;
        }
      }
    } finally {
      _isSyncing = false;
    }
  }
}
