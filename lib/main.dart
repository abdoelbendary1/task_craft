import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_craft/core/network/keys.dart';
import 'package:task_craft/core/services/sync/sync_action.dart';
import 'package:task_craft/core/theme/cubit/theme_cubit.dart';
import 'package:task_craft/core/theme/cubit/theme_state.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/tasks/data/model/task_model.dart';
import 'package:task_craft/shared/widgets/connectivity_overlay_wrapper.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: supabaseURL, anonKey: supabaseAnonKey);
  // Initialize Local Cache Layer
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(SyncActionInternal());
  // await Hive.openBox('app_cache');
  await configureDependencies();

  // Initialize Dependency Injection

  runApp(const TaskCraftApp());
}

class TaskCraftApp extends StatelessWidget {
  const TaskCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject ScreenUtil for perfect responsive scaling rules globally
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
       BlocProvider<AuthBloc>.value(
        value: getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()), 
      ),
        // 💡 Globally inject UserBloc so profile data is accessible in any route
        BlocProvider<UserBloc>(
          create: (context) => getIt<UserBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                routerConfig: appRouter,
                // title: 'TaskCraft',
                darkTheme: AppTheme.darkTheme,
                theme: AppTheme.lightTheme,
                themeMode: state.themeMode,
                debugShowCheckedModeBanner: false,
                builder: (context, routerChild) {
                  return ConnectivityOverlayWrapper(
                    child: routerChild ?? const SizedBox.shrink(),
                  );
                },
                // home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
