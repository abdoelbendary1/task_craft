// features/tasks/presentation/widgets/task_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/task_status.dart';
import 'package:task_craft/shared/components/app_check_box.dart';
import '../../domain/entities/task_entity.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onToggleStatus;
  final VoidCallback onDismissed;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.onToggleStatus,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDone = task.status == TaskStatus.done;

    return AnimatedSwitcher(
        // 🟢 الـ Key هنا هو أهم شيء لمنع فلاتر من تدمير الـ Widget فوراً
          key: ValueKey('task_internal_${task.id}_${task.status}'),
          
          // 🟢 زيادة الوقت لـ 700ms ليكون الانميشن واضحاً وبطيئاً جداً للعين
          duration: const Duration(milliseconds: 700),
          reverseDuration: const Duration(milliseconds: 500),
          
          switchInCurve: Curves.slowMiddle, // دخول ناعم وتدريجي
          switchOutCurve: Curves.slowMiddle,    // خروج مع حركة انسحابية واضحة للخلف
          
          transitionBuilder: (Widget child, Animation<double> animation) {
            // 🟢 ندمج حركتين معاً: التلاشي (Fade) مع انكماش الحجم (Size) لتبدو الحركة غاية في الوضوح
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.slowMiddle),
              ),
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1.0, // انكماش من الأعلى للأسفل لتبدو وكأن الكروت المجاورة تدفعها
                child: child,
              ),
            );
          },
      child: Dismissible(
        key: Key(task.id??""),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: const Icon(Icons.delete_outline, color: Colors.white),
        ),
        onDismissed: (_) => onDismissed(),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 6.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            child: Row(
              children: [
                // 🟢 الـ Custom Checkbox التفاعلي
               AppCheckBox(
                onToggleStatus: () => onToggleStatus(),checked: isDone,
      
               ),
                SizedBox(width: 14.w),
                // 🟢 نصوص المهمة
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title??"",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: isDone ? TextDecoration.lineThrough : null,
                          color: isDone ? theme.hintColor : theme.colorScheme.onSurface,
                        ),
                      ),
                      if (task.description?.isNotEmpty??false) ...[
                        SizedBox(height: 2.h),
                        Text(
                          task.description??"",
                          style: theme.textTheme.bodySmall?.copyWith(
                            decoration: isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // 🟢 مؤشر درجة الأهمية (Priority badge)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(task.priority?.id??0).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    task.priority?.label??"",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: _getPriorityColor(task.priority?.id??0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(int priorityId) {
    switch (priorityId) {
      case 2: return Colors.redAccent;    // High
      case 1: return Colors.orangeAccent; // Medium
      default: return Colors.green;       // Low
    }
  }
}