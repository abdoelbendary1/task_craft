// lib/core/utils/extensions/spacing_extension.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsivePaddingOnWidget on Widget {
  // =========================================================================
  // 🟢 ALL-SIDE PADDING WRAPPERS (Defaults to 16.w/h responsive metrics)
  // =========================================================================
  Widget p({double? value}) {
    final spatialValue = value?.r ?? 16.r; // .r applies minimum scale radius safety
    return Padding(
      padding: EdgeInsets.all(spatialValue),
      child: this,
    );
  }

  // =========================================================================
  // 🟢 SYMMETRIC RESPONSIVE PADDING
  // =========================================================================
  Widget px({double defaultHorizontal = 16.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultHorizontal.w),
        child: this,
      );

  Widget py({double defaultVertical = 16.0}) => Padding(
        padding: EdgeInsets.symmetric(vertical: defaultVertical.h),
        child: this,
      );

  Widget pxy({double horizontal = 16.0, double vertical = 8.0}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal.w,
          vertical: vertical.h,
        ),
        child: this,
      );

  // =========================================================================
  // 🟢 DIRECTIONAL / SPECIFIC RESPONSIVE PADDING
  // =========================================================================
  Widget pt(double value) => Padding(padding: EdgeInsets.only(top: value.h), child: this);
  Widget pb(double value) => Padding(padding: EdgeInsets.only(bottom: value.h), child: this);
  Widget pl(double value) => Padding(padding: EdgeInsets.only(left: value.w), child: this);
  Widget pr(double value) => Padding(padding: EdgeInsets.only(right: value.w), child: this);

  // =========================================================================
  // 🟧 RESPONSIVE MARGINS (Using standard Containers)
  // =========================================================================
  Widget mx({double value = 16.0}) => Container(
        margin: EdgeInsets.symmetric(horizontal: value.w),
        child: this,
      );

  Widget my({double value = 16.0}) => Container(
        margin: EdgeInsets.symmetric(vertical: value.h),
        child: this,
      );
}

// =========================================================================
// 🟦 QUICK BOXED SPACERS (Extension on numbers for fast empty layout spaces)
// =========================================================================
extension ResponsiveBoxSpacers on num {
  /// Creates a responsive vertical empty gap: `20.vSpace` replaces `SizedBox(height: 20.h)`
  Widget get vSpace => SizedBox(height: h);

  /// Creates a responsive horizontal empty gap: `12.hSpace` replaces `SizedBox(width: 12.w)`
  Widget get hSpace => SizedBox(width: w);
}