// features/tasks/presentation/widgets/task_progress_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/tasks/domain/entities/task_entity.dart';

class TaskProgressCard extends StatelessWidget {
  final List<TaskEntity> totalTasks;
  final List<TaskEntity> completedTasks;

  const TaskProgressCard({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double targetPercentage = totalTasks.isEmpty ? 0.0 : (completedTasks.length / totalTasks.length);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: TweenAnimationBuilder<double>(
          // 🟢 تحديد القيمة المستهدفة والمدة الزمنية ونوع الانسيابية (Curve)
          tween: Tween<double>(begin: 0.0, end: targetPercentage),
          duration: const Duration(milliseconds: 500), // نصف ثانية للحركة
          curve: Curves.easeInOutCubic, // حركة انسيابية ناعمة جداً في البداية والنهاية
          builder: (context, animatedValue, child) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project Progress",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "${completedTasks.length} of ${totalTasks.length} tasks completed",
                        style: theme.textTheme.bodySmall,
                      ),
                      SizedBox(height: 12.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: LinearProgressIndicator(
                          value: animatedValue, // 🟢 نمرر القيمة المتحركة هنا
                          minHeight: 8.h,
                          backgroundColor: theme.colorScheme.surfaceContainerLow,
                          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 54.r,
                      height: 54.r,
                      child: CircularProgressIndicator(
                        value: animatedValue, // 🟢 نمرر القيمة المتحركة هنا أيضاً ليتزامنا سوياً
                        strokeWidth: 6.w,
                        backgroundColor: theme.colorScheme.surfaceContainerLow,
                        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                      ),
                    ),
                    Text(
                      "${(animatedValue * 100).toInt()}%", // 🟢 العداد المئوي سيتحرك تصاعدياً وتنازلياً بشكل رائع
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}