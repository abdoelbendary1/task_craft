// features/settings/presentation/cubit/theme_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'app_theme_mode';

  ThemeCubit(this._prefs) : super(ThemeState.initial()) {
    _loadTheme(); // استدعاء الثيم المحفوظ بمجرد بناء الـ Cubit
  }

  // 1. استعادة الثيم المحفوظ من الـ Local Storage
  void _loadTheme() {
    final cachedTheme = _prefs.getString(_themeKey);
    if (cachedTheme != null) {
      final mode = ThemeMode.values.firstWhere(
        (e) => e.toString() == cachedTheme,
        orElse: () => ThemeMode.system,
      );
      emit(state.copyWith(themeMode: mode));
    }
  }

  // 2. ميثود لتغيير الثيم وحفظه تلقائياً
  Future<void> changeTheme(ThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    await _prefs.setString(_themeKey, mode.toString());
  }

  // 3. ميثود سريعة للـ Toggle (التبديل المباشر بين الـ Light والـ Dark)
  Future<void> toggleTheme(bool isDark) async {
    final targetMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await changeTheme(targetMode);
  }
}
