import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/home/presentation/pages/sections/build_home_body.dart';
import 'package:task_craft/features/home/presentation/widgets/header_section_view.dart';

class BuildHomeHeader extends StatelessWidget {
  const BuildHomeHeader({super.key });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
                pinned: false,
                floating: true,
                snap: true,
                elevation: 0,
                backgroundColor: theme.scaffoldBackgroundColor,
                surfaceTintColor: theme.scaffoldBackgroundColor,
                toolbarHeight: 150.h,
                title: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      authenticated:(user) => HeaderSectionView(
                      userName: user.name,
                      onSettingsPressed: () {},
                      onCreateProjectPressed: () => addTask(context),
                    ),
                    orElse: () => const SizedBox(),);
                  },
                ),
              );
  }
}