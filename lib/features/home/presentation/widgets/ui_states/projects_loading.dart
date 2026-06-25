import 'package:flutter/material.dart';
import 'package:task_craft/shared/components/project_card_shimmer.dart';

class ProjectsLoadingShimmerList extends StatelessWidget {
  final int itemCount;
  const ProjectsLoadingShimmerList({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ProjectCardShimmer();
        },
        childCount: itemCount, // بنعرض 3 كروت وهمية تلمع أثناء التحميل
      ),
    );
  }
}
