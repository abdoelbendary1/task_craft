// lib/core/services/notification/notification_state.dart
import 'package:flutter/material.dart';

enum NotificationType { success, error, info, warning }

class NotificationPayload {
  final String title;
  final String message;
  final NotificationType type;
  final Duration duration;

  NotificationPayload({
    required this.title,
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 4),
  });

  // Master styling controller for consistent UI design tokens
  Color get backgroundColor {
    switch (type) {
      case NotificationType.success: return const Color(0xFFECFDF3);
      case NotificationType.error: return const Color(0xFFFEF3F2);
      case NotificationType.warning: return const Color(0xFFFEF0C7);
      case NotificationType.info: return const Color(0xFFF2F4F7);
    }
  }

  Color get borderColor {
    switch (type) {
      case NotificationType.success: return const Color(0xFFD1FADF);
      case NotificationType.error: return const Color(0xFFFEE4E2);
      case NotificationType.warning: return const Color(0xFFFEDF89);
      case NotificationType.info: return const Color(0xFFEAECF0);
    }
  }

  Color get textColor {
    switch (type) {
      case NotificationType.success: return const Color(0xFF027A48);
      case NotificationType.error: return const Color(0xFFB42318);
      case NotificationType.warning: return const Color(0xFFB54708);
      case NotificationType.info: return const Color(0xFF344054);
    }
  }

  IconData get icon {
    switch (type) {
      case NotificationType.success: return Icons.check_circle_outline_rounded;
      case NotificationType.error: return Icons.error_outline_rounded;
      case NotificationType.warning: return Icons.warning_amber_rounded;
      case NotificationType.info: return Icons.info_outline_rounded;
    }
  }
}