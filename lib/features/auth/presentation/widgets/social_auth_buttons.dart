import 'package:flutter/material.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildProviderButton("Google", Icons.g_mobiledata)),
        const SizedBox(width: 12),
        Expanded(child: _buildProviderButton("Apple", Icons.apple)),
      ],
    );
  }

  Widget _buildProviderButton(String name, IconData icon) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: Colors.white10, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.white70, size: 22),
      label: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
