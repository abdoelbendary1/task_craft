import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/helpers/helpers.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/home/presentation/add_project/bloc/new_project_bloc.dart';

class DateTimePickerRow extends StatelessWidget {
  const DateTimePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewProjectBloc, NewProjectState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick a Deadline',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
            10.vSpace,
            Row(
              children: [
                // 🟢 التعديل هنا: الـ Expanded يغلف الـ GestureDetector ليكون ابناً مباشراً للـ Row
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        currentDate: state.project.dueDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );

                      if (date != null) {
                        context.read<NewProjectBloc>().add(
                          NewProjectEvent.dueDateChanged(date),
                        );
                      }
                    },
                    child: _PickerTile(
                      icon: Icons.calendar_today_rounded,
                      label: 'DUE DATE',
                      value: state.project.dueDate == null
                          ? '--/--/--'
                          : " ${state.project.dueDate?.format()}",
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ).px(defaultHorizontal: 24);
      },
    );
  }
}

class _PickerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isPlaceholder;

  const _PickerTile({
    required this.icon,
    required this.label,
    required this.value,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    // 🟢 تم إزالة الـ Expanded من هنا ليكون الـ Widget نظيف وقابل لإعادة الاستخدام في أي مكان
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.activeBlueBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.activeBlueText, size: 22.sp),
          10.hSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: const Color(0xFF64748B),
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: isPlaceholder
                      ? AppColors.titleGrey
                      : AppColors.primaryNavy,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}