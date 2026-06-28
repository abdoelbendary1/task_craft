
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/routing/app_router.dart';
import 'package:task_craft/core/theme/cubit/theme_cubit.dart';
import 'package:task_craft/core/theme/cubit/theme_state.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_craft/shared/components/setting_tile.dart'; // 💡 Import atomic widget

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        elevation: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            unauthenticated: (_) => const LoginRoute().go(context),
            orElse: () {},
          );
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (user) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 👤 Adaptive Profile Image Stack with Edit Icon
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? theme.cardColor : Colors.white,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(isDark ? 0.3 : 0.06),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: theme.disabledColor.withOpacity(0.1),
                              backgroundImage: NetworkImage(
                                user.avatarUrl?.isNotEmpty ?? false
                                    ? user.avatarUrl!
                                    : 'https://i.imgur.com/Dx8Z4S7.png',
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: theme.colorScheme.primary,
                                child: const Icon(Icons.edit, color: Colors.white, size: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.vSpace, // 💡 Using custom responsive extension spacer

                      Text(
                        user.name,
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      4.vSpace,
                      Text(
                        user.email,
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                      ),
                      16.vSpace,

                      // Account Plan Status Badges
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'PRO PLAN',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          12.hSpace, // 💡 Using custom responsive extension spacer
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'ADMIN',
                              style: TextStyle(
                                color: theme.colorScheme.onSecondaryContainer,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      32.vSpace,

                      // 🛠️ Section: Account Settings
                      _buildSectionTitle(context, 'ACCOUNT SETTINGS'),
                      8.vSpace,
                      Card(
                        elevation: 0,
                        color: theme.cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: theme.dividerColor.withOpacity(0.5)),
                        ),
                        child: Column(
                          children: [
                            SettingTile(
                              icon: Icons.security_outlined,
                              title: 'Account Security',
                              onTap: () {},
                            ),
                            const Divider(height: 1),
                            SettingTile(
                              icon: Icons.notifications_none_outlined,
                              title: 'Notifications',
                              onTap: () {},
                            ),
                            const Divider(height: 1),
                            BlocBuilder<ThemeCubit, ThemeState>(
                              builder: (context, themeState) {
                                final isDarkMode = themeState.themeMode == ThemeMode.dark;
                                return SettingTile(
                                  icon: Icons.dark_mode_outlined,
                                  title: 'Dark Mode',
                                  showChevron: false,
                                  trailingWidget: Switch.adaptive(
                                    value: isDarkMode,
                                    activeColor: theme.colorScheme.primary,
                                    onChanged: (val) {
                                      context.read<ThemeCubit>().toggleTheme(val);
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      24.vSpace,

                      // 🛠️ Section: Support
                      _buildSectionTitle(context, 'SUPPORT'),
                      8.vSpace,
                      Card(
                        elevation: 0,
                        color: theme.cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: theme.dividerColor.withOpacity(0.5)),
                        ),
                        child: Column(
                          children: [
                            SettingTile(
                              icon: Icons.help_outline_rounded,
                              title: 'Help Center',
                              showChevron: false,
                              trailingWidget: Icon(Icons.open_in_new, color: theme.hintColor, size: 20),
                            ),
                            const Divider(height: 1),
                            SettingTile(
                              icon: Icons.info_outline,
                              title: 'About TaskCraft',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      32.vSpace,

                      // 🚪 Logout Interaction Button Container
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: isDark ? Colors.redAccent : const Color(0xFFFDA29B),
                              width: 1.5,
                            ),
                            backgroundColor: isDark ? Colors.red.withOpacity(0.1) : const Color(0xFFFEF3F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(const AuthEvent.loggedOut());
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            color: isDark ? Colors.redAccent : const Color(0xFFB42318),
                          ),
                          label: Text(
                            'Logout',
                            style: TextStyle(
                              color: isDark ? Colors.redAccent : const Color(0xFFB42318),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      16.vSpace,

                      Text(
                        'Version 2.4.0 (2026)',
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                      ),
                      40.vSpace,
                    ],
                  ).p(value: 24), // 💡 Using your responsive extension padding layout anchor wrapper
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.hintColor,
          letterSpacing: 0.8,
        ),
      ).pl(4), // 💡 Using your custom responsive left padding utility extension
    );
  }
}