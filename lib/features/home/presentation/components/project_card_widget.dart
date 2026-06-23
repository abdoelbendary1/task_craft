import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/home/presentation/components/app_badge.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String dueDate;
  final VoidCallback onTap;

  const ProjectCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: theme.colorScheme.primary.withOpacity(0.5),
          width: 1.w,
        ),
      ),
      color: theme.colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBadge(
                    label: status,
                    backgroundColor: theme.primaryColor.withOpacity(0.1),
                    textColor: theme.primaryColor,
                  ),
                  Icon(Icons.more_vert, color: theme.hintColor),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
              SizedBox(height: 4.h),
              Divider(color: theme.colorScheme.secondary.withOpacity(0.5)),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14.r,
                    color: theme.hintColor,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    dueDate,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
