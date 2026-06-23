import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBarScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    // Dynamically tracking the ambient context theme to prevent layout leakage
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
