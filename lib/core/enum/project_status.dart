import 'package:flutter/material.dart';
import 'package:task_craft/core/theme/app_colors.dart';

enum ProjectStatus {
  pending(1, 'Pending', AppColors.warning),
  inProgress(2, 'In Progress' , AppColors.purple),
  done(3, 'Done', AppColors.success),;

  // 🟢 Maps explicitly to your Supabase DB ID values
  final int id;
  final String label;
  final Color color;

  const ProjectStatus(this.id, this.label, this.color );

  // Helper to convert database integer IDs directly into type-safe Enums
  static ProjectStatus fromId(int id) {
    return ProjectStatus.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ProjectStatus.pending,
    );
  }
}