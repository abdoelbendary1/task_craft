import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_craft/core/routing/app_routes.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/auth/presentation/pages/login_screen.dart';
import 'package:task_craft/features/auth/presentation/pages/register_screen.dart';
import 'package:task_craft/features/bottom_nav_bar.dart';
import 'package:task_craft/features/home/presentation/pages/home_screen.dart';
import 'package:task_craft/features/profile/presentation/pages/profile_screen.dart';
part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  // 🔄 1. DYNAMIC AUTHENTICATION REDIRECT GUARD
  // redirect: (context, state) {
  //   final authState = context.read<AuthBloc>().state;

  //   // Check if the user is logged in based on your AuthBloc state
  //   final bool isLoggedIn = authState.maybeWhen(
  //     authenticated: (_) => true,
  //     orElse: () => false,
  //   );

  //   final bool isLoggingIn = state.matchedLocation == AppRoutes.login;

  //   // If not logged in and trying to access app pages -> Force redirect to Login
  //   if (!isLoggedIn && !isLoggingIn) return AppRoutes.login;

  //   // If logged in and trying to view Login page -> Push them to Home instead
  //   if (isLoggedIn && isLoggingIn) return AppRoutes.home;

  //   // No redirection needed, proceed normally
  //   return null;
  // }, // شاشة البداية
  routes: $appRoutes,
);

@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData with $LoginRoute {
  // 💡 Added 'with $LoginRoute' here
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

@TypedGoRoute<RegisterRoute>(path: AppRoutes.register)
class RegisterRoute extends GoRouteData with $RegisterRoute {
  // 💡 Added 'with $LoginRoute' here
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterScreen();
}

// ==========================================
// 3. بناء الـ Shell Route (Bottom Nav Bar)
// ==========================================
@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: AppRoutes.home,
          routes: <TypedRoute<RouteData>>[],
        ),
      ],
    ),

    TypedStatefulShellBranch<ProfileBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: AppRoutes.profile),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    // بنمرر الـ navigationShell للـ Scaffold الخارجي عشان يرسم الـ Bottom NavBar
    return BottomNavBarScaffold(navigationShell: navigationShell);
  }
}

// ==========================================
// 4. تعريف الـ Branches (الأفرع بتاعة الـ Tabs)
// ==========================================
class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();
}

// ==========================================
// ==========================================

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen();
}
