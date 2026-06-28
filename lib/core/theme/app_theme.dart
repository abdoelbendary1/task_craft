import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      cardColor: AppColors.surfaceWhite,
      hintColor: AppColors.textMuted,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceWhite,
        onPrimary: Colors.white,
        onSurface: AppColors.textDark,
        surfaceContainerLow: Color(0xFFF1F5F9), // لون خلفية الـ Checkbox أو الكروت الباهتة
      ),

      // 🔘 تخصيص الخطوط عالمياً للـ Light Mode
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.textDark),
        titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textDark),
        bodyLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.textDark),
        bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textMuted),
      ),

      // 🎴 تخصيص الكروت الافتراضي
      cardTheme: CardThemeData(
        color: AppColors.surfaceWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),

      // 📌 تخصيص الـ AppBar الافتراضي
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
        scrolledUnderElevation: 0,
      ),

      // Centralized Navigation Bar Global Component Customizations
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 10,
        height: 72.h,
        indicatorColor: const Color(0xFF3B59BA), 
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: Colors.white, size: 22.r);
          }
          return IconThemeData(color: const Color(0xFF64748B), size: 22.r);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF3B59BA));
          }
          return TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF64748B));
        }),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),

      // Adaptive Component Styling for Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceWhite,
        hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),

      // Adaptive Component Styling for Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 52.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.secondary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.darkSurface,
      hintColor: AppColors.darkTextMuted,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.darkSurface,
        surface: AppColors.darkSurface,
        onPrimary: Colors.white,
        onSurface: AppColors.darkTextPrimary,
        surfaceContainerLow: Color(0xFF1E293B), // خلفية داكنة متناسقة لعناصر الـ Checkbox في الـ Dark
      ),

      // 🔘 تخصيص الخطوط عالمياً للـ Dark Mode
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.darkTextPrimary),
        titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.darkTextPrimary),
        bodyLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.darkTextPrimary),
        bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.darkTextMuted),
      ),

      // 🎴 تخصيص الكروت للوضع الداكن
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),

      // 📌 تخصيص الـ AppBar للوضع الداكن
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
        scrolledUnderElevation: 0,
      ),

      // Navigation Bar Dark Customizations
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkBackground,
        elevation: 10,
        height: 72.h,
        indicatorColor: AppColors.primary,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: Colors.white, size: 22.r);
          }
          return IconThemeData(color: AppColors.darkTextMuted, size: 22.r);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.primary);
          }
          return TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.darkTextMuted);
        }),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: TextStyle(color: AppColors.darkTextMuted, fontSize: 14.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 52.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}