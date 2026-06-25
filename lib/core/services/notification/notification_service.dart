// lib/core/services/notification/notification_service.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_craft/core/routing/app_router.dart';
import 'notification_state.dart';
import 'notification_banner_widget.dart';

class NotificationService {
  // 🟢 Global Key to be attached to your MaterialApp for context-free dispatching
static GlobalKey<NavigatorState> get navigatorKey => rootNavigatorKey;
  static OverlayEntry? _currentOverlayEntry;
  static Timer? _dismissTimer;

  static void show({
     String? title,
     String? message,
    required NotificationType type,
    Duration duration = const Duration(seconds: 4),
  }) {
    
    
 WidgetsBinding.instance.addPostFrameCallback((_) {
      
      // 🟢 2. Target the overlay state directly from the navigator state instance 
      // This returns null safely instead of throwing a hard exception!
      final OverlayState? overlayState = navigatorKey.currentState?.overlay;
      
      // Safety guard clause: If GoRouter hasn't mounted the navigator widget yet, exit quietly
      if (overlayState == null) return;
    final payload = NotificationPayload(title: title ??type.name, message: message??"", type: type, duration: duration);

    
      
      _clearActiveAlert();

      _currentOverlayEntry = OverlayEntry(
        builder: (context) => TopNotificationBanner(
          payload: payload,
          onDismiss: () => _clearActiveAlert(),
        ),
      );

      // 🟢 3. Insert cleanly directly into the verified root overlay layer
      overlayState.insert(_currentOverlayEntry!);

      _dismissTimer = Timer(duration, () {
        _clearActiveAlert();
      });
    });
  
  }

  static void _clearActiveAlert() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    if (_currentOverlayEntry != null) {
      _currentOverlayEntry!.remove();
      _currentOverlayEntry = null;
    }
  }
}