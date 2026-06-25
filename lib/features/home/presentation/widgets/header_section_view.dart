import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/home/presentation/widgets/user_header.dart';
import 'package:task_craft/features/home/presentation/widgets/projects_header.dart';

class HeaderSectionView extends StatelessWidget {
  final String userName;
  final VoidCallback onSettingsPressed;
  final VoidCallback onCreateProjectPressed;

  const HeaderSectionView({
    super.key,
    required this.userName,
    required this.onSettingsPressed,
    required this.onCreateProjectPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserHeader(userName: userName, onSettingsPressed: onSettingsPressed),
        16.verticalSpace,
        ProjectsHeader( onCreateProjectPressed: onCreateProjectPressed),    
        16.verticalSpace,

      ],
    );
  }
}


