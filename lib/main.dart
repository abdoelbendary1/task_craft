import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_craft/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_craft/features/home/data/models/project_model.dart';
import 'package:task_craft/features/home/data/models/task_model.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Local Cache Layer
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
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
      providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: appRouter,
            // title: 'TaskCraft',
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,

            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
