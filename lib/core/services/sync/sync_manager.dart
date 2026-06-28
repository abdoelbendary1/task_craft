// lib/core/network/sync/sync_manager.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/core/network/api_client.dart';
import 'sync_action.dart';
@lazySingleton
class SyncManager {
  final Box<SyncAction> _queueBox;
  final ApiClient _apiClient; // 🟢 Swap raw Dio for your structured ApiClient
  bool _isSyncing = false;

  SyncManager(this._queueBox, this._apiClient) {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
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
    final actionId = payload['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();

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

    print("🔄 [SYNC MANAGER]: Internet restored, flushing queue items...");

    try {
      final actions = _queueBox.values.toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      for (final action in actions) {
        try {
          // 🟢 Execute request using the exact same pipeline your online data source uses
          await _apiClient.request<dynamic>(
            path: action.endpoint,
            method: action.method,
            data: action.payload,
            fromJson: (json) => json, // We only care that the request completes successfully
          );
          
          print("✅ [SYNC SUCCESS]: Synced action ID ${action.id}");
          await _queueBox.delete(action.id);
        } on DioException catch (e) {
          print("❌ [SYNC ERROR] on ID ${action.id}: ${e.response?.data ?? e.message}");
          
          if (e.type == DioExceptionType.connectionError) {
            // Internet dropped mid-execution, pause loop until network recovers
            break; 
          }
          
          // If the error is a bad request format (400, 422, 404), remove it 
          // from the queue so it doesn't permanently block subsequent synchronization actions
          await _queueBox.delete(action.id); 
        }
      }
    } finally {
      _isSyncing = false;
    }
  }
}
// @lazySingleton
// class SyncManager {
//   final Box<SyncAction> _queueBox;
//   final Dio _dio;
//   bool _isSyncing = false;

//   SyncManager(this._queueBox, this._dio) {
//     Connectivity().onConnectivityChanged.listen((
//       List<ConnectivityResult> results,
//     ) {
//       if (!results.contains(ConnectivityResult.none)) {
//         flushQueue();
//       }
//     });
//   }

//   Future<void> addToActionQueue({
//     required String endpoint,
//     required String method,
//     required Map<String, dynamic> payload,
//   }) async {
//     final actionId =
//         payload['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();

//     final action = SyncAction(
//       id: actionId,
//       endpoint: endpoint,
//       method: method,
//       payload: payload,
//       timestamp: DateTime.now().millisecondsSinceEpoch,
//     );

//     await _queueBox.put(actionId, action);
//   }

//   Future<void> flushQueue() async {
//     if (_isSyncing || _queueBox.isEmpty) return;
//     _isSyncing = true;

//     try {
//       final actions = _queueBox.values.toList()
//         ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

//       for (final action in actions) {
//         try {
//           await _dio.request(
//             action.endpoint,
//             data: action.payload,
//             options: Options(method: action.method),
//           );
//           await _queueBox.delete(action.id);
//         } on DioException catch (e) {
//           if (e.type != DioExceptionType.connectionError) {
//             continue;
//           }
//           break;
//         }
//       }
//     } finally {
//       _isSyncing = false;
//     }
//   }
// }
