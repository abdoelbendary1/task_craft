import 'package:flutter/material.dart';
import 'package:task_craft/core/theme/app_colors.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool obscure;
  final Widget? trailing;
  final TextInputType? keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.obscure = false,
    this.trailing,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          cursorColor: theme.textTheme.bodyLarge?.color,
          style: TextStyle(color: AppColors.activeBlueBg, fontSize: 15),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white38, size: 20),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
            filled: true,
            fillColor: AppColors.activeBlueText,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white10, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
