// lib/core/routing/app_router.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_craft/core/di/injection.dart';
import 'package:task_craft/core/routing/app_routes.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/auth/presentation/pages/login_screen.dart';
import 'package:task_craft/features/auth/presentation/pages/register_screen.dart';
import 'package:task_craft/features/bottom_nav_bar.dart';
import 'package:task_craft/features/home/presentation/pages/home_screen.dart';
import 'package:task_craft/features/profile/presentation/pages/profile_screen.dart';
import 'package:task_craft/features/tasks/presentation/add_task/add_task_bottom_sheet.dart';
import 'package:task_craft/features/tasks/presentation/add_task/bloc/new_task_bloc.dart';
import 'package:task_craft/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_craft/features/tasks/presentation/pages/tasks_view.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  
  // 🟢 تأكد أن الـ Stream يقرأ من نفس الـ Instance المتاحة عالمياً للتطبيق
  refreshListenable: _convertStreamToListenable(
    getIt<AuthBloc>().stream, 
  ),

  redirect: (context, state) {
    // 1. نقرأ الحالة الحالية من الـ Bloc الرئيسي مباشرة عبر getIt لضمان دقة البيانات
    final authState = getIt<AuthBloc>().state;

    final bool isLoggedIn = authState.maybeWhen(
      authenticated: (_) => true,
      orElse: () => false,
    );

    final String location = state.matchedLocation;
    final bool isAuthRoute = location == AppRoutes.login || location == AppRoutes.register;

    // 🔬 طباعة للمراقبة (Debug Logs) لمعرفة من الجاني في قفل الـ Navigation
    debugPrint('🚦 ROUTER REDIRECT: Location = $location | IsLoggedIn = $isLoggedIn');

    // 🟢 القاعدة الأولى: لو المستخدم غير مسجل ويحاول الدخول للتطبيق -> أرجعه للـ Login
    if (!isLoggedIn && !isAuthRoute) {
      debugPrint('🛑 Access Denied: Redirecting to LOGIN');
      return AppRoutes.login;
    }

    // 🟢 القاعدة الثانية: لو المستخدم مسجل بالفعل ويقف في شاشات الـ Auth (سواء فتح التطبيق أو سجل يدوياً)
    // خذه فوراً إلى الـ Home
    if (isLoggedIn && isAuthRoute) {
      debugPrint('🎉 Access Granted: Redirecting to HOME');
      return AppRoutes.home;
    }

    // اترك المستخدم يكمل مساره الطبيعي دون اعتراض
    return null;
  },
  routes: $appRoutes,
);
Listenable? _convertStreamToListenable(Stream? stream) {
  if (stream == null) return null;
  final notifier = ValueNotifier<void>(null);
  stream.listen((_) => notifier.value = null);
  return notifier;
}

// ==========================================
// 1. مسارات الـ Authentication
// ==========================================
@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginScreen();
}

@TypedGoRoute<RegisterRoute>(path: AppRoutes.register)
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const RegisterScreen();
}

// ==========================================
// 2. الـ Shell Route (استقرار الـ Bottom NavBar)
// ==========================================
@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: AppRoutes.home,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<ProjectTasksRoute>(
              path: AppRoutes.projectTasks,
              routes: <TypedRoute<RouteData>>[
                // 💡 تداخل ذكي: الـ AddTask مسار فرعي مباشر داخل الـ Project Tasks ليكون أعلى الشاشة تماماً
                TypedGoRoute<AddTaskRoute>(path: 'add-task'), 
              ],
            ),
          ],
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
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return BottomNavBarScaffold(navigationShell: navigationShell);
  }
}

class HomeBranchData extends StatefulShellBranchData { const HomeBranchData(); }
class ProfileBranchData extends StatefulShellBranchData { const ProfileBranchData(); }

// ==========================================
// 3. الـ Routes والـ Injection المستقر للمهام
// ==========================================
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfileScreen();
}

class ProjectTasksRoute extends GoRouteData with $ProjectTasksRoute {
  final String id;
  final String title;

  const ProjectTasksRoute({required this.id, required this.title});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProjectTasksBloc>()..add(ProjectTasksEvent.started(id))),
        BlocProvider(create: (_) => getIt<NewTaskBloc>()),
      ],
      child: TasksView(projectId: id, projectTitle: title),
    );
  }
}

// 💡 تم إضافة الـ Mixin التابع للمسار الفرعي حتى تختفي الـ UnimplementedError
class AddTaskRoute extends GoRouteData with $AddTaskRoute {
  final String projectId; 

  const AddTaskRoute({required this.projectId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      opaque: false, 
      barrierColor: Colors.black54, 
      barrierDismissible: true,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        );
      },
      child: BlocProvider(
        create: (context) => getIt<NewTaskBloc>(),
        child: AddTaskBottomSheet(
          projectId: projectId, 
          onTaskCreated: (newProject) {
            // Callback التحديث
          },
        ),
      ),
    );
  }
}