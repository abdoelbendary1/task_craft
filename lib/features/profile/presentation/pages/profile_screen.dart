// lib/features/profile/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFF3F51B5);
    const badgeBgColor = Color(0xFFE8EAF6);

    // Grabs the live logged-in user entity state from your AuthBloc engine

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            return Scaffold(
              backgroundColor: const Color(0xFFFAFBFF),
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.5,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.avatarUrl ?? 'https://i.imgur.com/Dx8Z4S7.png',
                  ),
                ),
                title: const Text(
                  'TaskCraft',
                  style: TextStyle(
                    color: Color(0xFF101828),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF3F51B5),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 👤 Profile Image Stack with Edit Icon
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              user?.avatarUrl ??
                                  'https://i.imgur.com/Dx8Z4S7.png',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {}, // Trigger local photo gallery picker
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: brandColor,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // User Meta Information
                    Text(
                      user?.name ?? 'Alex Rivera',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101828),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'alex.rivera@taskcraft.io',
                      style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                    ),
                    const SizedBox(height: 16),

                    // Dynamic Account Badges
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: brandColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'PRO PLAN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: badgeBgColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'ADMIN',
                            style: TextStyle(
                              color: brandColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // 🛠️ Section: Account Settings
                    _buildSectionTitle('ACCOUNT SETTINGS'),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFEAECF0)),
                      ),
                      child: Column(
                        children: [
                          _buildSettingTile(
                            Icons.security_outlined,
                            'Account Security',
                            true,
                          ),
                          const Divider(height: 1, color: Color(0xFFEAECF0)),
                          _buildSettingTile(
                            Icons.notifications_none_outlined,
                            'Notifications',
                            true,
                          ),
                          const Divider(height: 1, color: Color(0xFFEAECF0)),
                          _buildSettingTile(
                            Icons.dark_mode_outlined,
                            'Dark Mode',
                            false,
                            trailingWidget: Switch(
                              value: false,
                              activeColor: brandColor,
                              onChanged: (val) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🛠️ Section: Support
                    _buildSectionTitle('SUPPORT'),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFEAECF0)),
                      ),
                      child: Column(
                        children: [
                          _buildSettingTile(
                            Icons.help_outline_rounded,
                            'Help Center',
                            false,
                            trailingWidget: const Icon(
                              Icons.open_in_new,
                              color: Color(0xFF98A2B3),
                              size: 20,
                            ),
                          ),
                          const Divider(height: 1, color: Color(0xFFEAECF0)),
                          _buildSettingTile(
                            Icons.info_outline,
                            'About TaskCraft',
                            true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // 🚪 Logout Interaction Button Component
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFFFDA29B),
                            width: 1.5,
                          ),
                          backgroundColor: const Color(0xFFFEF3F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // 🟢 Triggers the clearSession pipeline inside your clean architecture layer!
                          context.read<AuthBloc>().add(
                            const AuthEvent.loggedOut(),
                          );
                        },
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Color(0xFFB42318),
                        ),
                        label: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFFB42318),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Version 2.4.0 (2026)',
                      style: TextStyle(color: Color(0xFF98A2B3), fontSize: 12),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  // Helper builder for setting items
  Widget _buildSettingTile(
    IconData icon,
    String title,
    bool showChevron, {
    Widget? trailingWidget,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFEBF0FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF3F51B5), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF344054),
          fontSize: 15,
        ),
      ),
      trailing:
          trailingWidget ??
          (showChevron
              ? const Icon(Icons.chevron_right, color: Color(0xFF98A2B3))
              : null),
      onTap: trailingWidget != null ? null : () {},
    );
  }

  // Helper builder for category headers
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF667085),
          letterSpacing: 0.8,
        ),
      ).pl(4),
    );
  }
}
