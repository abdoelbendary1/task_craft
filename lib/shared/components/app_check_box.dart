import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCheckBox extends StatelessWidget {
  void Function()? onToggleStatus;
  final bool? checked;
   AppCheckBox({super.key, this.onToggleStatus, this.checked,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return // داخل ملف task_item_widget.dart في الـ leading الخاص بالـ ListTile أو التصميم الخاص بك
GestureDetector(
  onTap: onToggleStatus,
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInCubic,
    width: 24.r,
    height: 24.r,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      // 🎨 يتغير اللون والخلفية بناءً على حالة الـ Task
      color: checked??false
          ? theme.colorScheme.primary
          : Colors.transparent,
      border: Border.all(
        color: checked??false
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface.withOpacity(0.4),
        width: 2.w,
      ),
    ),
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: checked??false
          ? Icon(
              Icons.check,
              key: const ValueKey('checked'),
              size: 16.r,
              color: theme.colorScheme.onPrimary,
            )
          : SizedBox(key: const ValueKey('unchecked')),
    ),
  ),
);
  }
}