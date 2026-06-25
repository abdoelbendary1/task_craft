import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/helpers/helpers.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/shared/components/app_badge.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback? onTap;
  final void Function(DismissDirection)? onDismissed;

  const ProjectCardWidget({
    super.key,
    required this.project,
    this.onTap,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(project.id),
      onDismissed: onDismissed,
      background: _buildDismissibleBackground(),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: BorderSide(color: AppColors.borderLight, width: 1.w),
        ),
        color: AppColors.surfaceWhite,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.all(18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardHeaderSection(project: project),
                14.vSpace,
                _CardTitleSection(title: project.title),
                8.vSpace,
                _CardDescriptionSection(description: project.description),
                20.vSpace,
                _CardBottomTraySection(dueDate: project.dueDate),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.red,
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: const Icon(Icons.delete, color: AppColors.secondary),
    );
  }
}

// ==========================================================================
// 🟢 الأقسام المنفصلة (Sub-sections) للكارت الأصلي
// ==========================================================================

class _CardHeaderSection extends StatelessWidget {
  final ProjectEntity project;
  const _CardHeaderSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final status = ProjectStatus.fromId(project.statusId);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBadge(
          label: status.label,
          backgroundColor: status.color.withOpacity(0.2),
          textColor: status.color,
        ),
        const Icon(Icons.more_vert, color: AppColors.secondarySlate),
      ],
    );
  }
}

class _CardTitleSection extends StatelessWidget {
  final String title;
  const _CardTitleSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.primaryNavy,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
      ),
    );
  }
}

class _CardDescriptionSection extends StatelessWidget {
  final String description;
  const _CardDescriptionSection({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.secondarySlate,
        fontSize: 14.sp,
        height: 1.4,
      ),
    );
  }
}

class _CardBottomTraySection extends StatelessWidget {
  final DateTime? dueDate;
  const _CardBottomTraySection({this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 28.h,
          width: 68.w,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=32',
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=68',
                  ),
                ),
              ),
              Positioned(
                left: 32.w,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: const Color(0xFF3B56BE),
                  child: Text(
                    '+3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 14.sp,
              color: AppColors.secondarySlate,
            ),
            SizedBox(width: 6.w),
            Text(
              dueDate != null ? "Deadline ${dueDate?.format()}" : "No Deadline",
              style: TextStyle(
                color: AppColors.primaryNavy,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
