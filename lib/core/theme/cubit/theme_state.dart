// features/settings/presentation/cubit/theme_state.dart
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});

  // الحالة الابتدائية للتطبيق (تتبع نظام التشغيل كوضع افتراضي)
  factory ThemeState.initial() => const ThemeState(themeMode: ThemeMode.system);

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }
}
