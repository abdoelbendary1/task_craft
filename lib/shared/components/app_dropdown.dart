import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// هيكل يمثل كل عنصر داخل القائمة
class AppDropdownItem<T> {
  final T value;
  final String label;
  final IconData? icon;

  const AppDropdownItem({
    required this.value,
    required this.label,
    this.icon,
  });
}

// الويدجت المشتركة والذكية
class AppDropdownMenu<T> extends StatelessWidget {
  final List<AppDropdownItem<T>> items;
  final T selectedValue;
  final ValueChanged<T> onSelected;
  final Widget? customTrigger; // زر مخصص للضغط (اختياري)

  const AppDropdownMenu({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onSelected,
    this.customTrigger,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // العثور على العنصر المختار حالياً لعرض نصه أو أيقونته إذا لزم الأمر
    final currentItem = items.firstWhere((item) => item.value == selectedValue);

    return PopupMenuButton<T>(
      initialValue: selectedValue,
      onSelected: onSelected,
      elevation: 3,
      // تنعيم الحواف لتطابق كروت التطبيق
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      // تخصيص شكل الزر الخارجي إذا لم يمرر المستخدم زراً مخصصاً
      child: customTrigger ?? Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (currentItem.icon != null) ...[
              Icon(currentItem.icon, size: 16.sp, color: theme.colorScheme.primary),
              SizedBox(width: 6.w),
            ],
            Text(
              currentItem.label,
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600,color: theme.primaryColor),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16.sp, color: theme.hintColor),
          ],
        ),
      ),
      // بناء عناصر القائمة الداخلية
      itemBuilder: (BuildContext context) {
        return items.map((AppDropdownItem<T> item) {
          final isSelected = item.value == selectedValue;
          
          return PopupMenuItem<T>(
            value: item.value,
            child: Row(
              children: [
                if (item.icon != null) ...[
                  Icon(
                    item.icon, 
                    size: 18.sp, 
                    color: isSelected ? theme.colorScheme.primary : theme.hintColor,
                  ),
                  SizedBox(width: 10.w),
                ],
                Text(
                  item.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  Icon(Icons.check_rounded, size: 16.sp, color: theme.colorScheme.primary),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}