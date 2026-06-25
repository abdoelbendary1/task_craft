import 'package:flutter/material.dart';
import 'package:task_craft/features/home/presentation/widgets/user_greeting.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
    required this.userName,
    required this.onSettingsPressed,
  });

  final String userName;
  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildUserGreeting( userName: userName),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: onSettingsPressed,
          color: theme.colorScheme.onSurface,
        ),
      ],
    );
  }
}
