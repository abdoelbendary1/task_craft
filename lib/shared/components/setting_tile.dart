// lib/features/profile/presentation/widgets/setting_tile.dart

import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool showChevron;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.showChevron = true,
    this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: 22),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      trailing: trailingWidget ??
          (showChevron
              ? Icon(Icons.chevron_right, color: theme.hintColor)
              : null),
      onTap: trailingWidget != null ? null : onTap,
    );
  }
}