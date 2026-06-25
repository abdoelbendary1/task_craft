import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/enum/project_status.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/home/domain/entities/project_entity.dart';
import 'package:task_craft/shared/components/app_badge.dart';

class ProjectCardWidget extends StatelessWidget {
 ProjectEntity project;
  final VoidCallback? onTap;
void Function(DismissDirection)? onDismissed;
   ProjectCardWidget({
    super.key,
    required this.project,
     this.onTap,
     this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
                             key: Key(project.id),
                             onDismissed:onDismissed,
                             background: Container(
                               color: theme.colorScheme.error,
                               alignment: Alignment.centerRight,
                               child:  Icon(
                                 Icons.delete,
                                 color: AppColors.surfaceWhite,
                               ),
                             ),
                             child: Card(
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
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   AppBadge(
                     label: ProjectStatus.fromId(project.statusId).label,
                     backgroundColor: ProjectStatus.fromId(project.statusId).color.withOpacity(0.1),
                     textColor: ProjectStatus.fromId(project.statusId).color,
                   ),
                   Icon(Icons.more_vert, color: theme.hintColor),
                 ],
               ),
               SizedBox(height: 12.h),
               Text(
                 project.title,
                 style: theme.textTheme.titleMedium?.copyWith(
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 6.h),
               Text(
                 project.description,
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                 style: theme.textTheme.bodyMedium?.copyWith(
                   color: theme.hintColor,
                 ),
               ),
               SizedBox(height: 4.h),
              
             ],
           ).p(),
         ),
       ),
     ).pb(8);
  }
}
