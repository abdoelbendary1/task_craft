// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/auth_remote_data_surce.dart'
    as _i853;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/auth_useCases.dart' as _i467;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/bloc/user_bloc/user_bloc.dart' as _i72;
import '../../features/home/data/datasources/project_local_data_source.dart'
    as _i842;
import '../../features/home/data/datasources/project_remote_data_source.dart'
    as _i744;
import '../../features/home/data/models/project_model.dart' as _i341;
import '../../features/home/data/repositories/project_repository_impl.dart'
    as _i403;
import '../../features/home/domain/repositories/project_repository.dart'
    as _i447;
import '../../features/home/domain/usecases/create_project.dart' as _i1015;
import '../../features/home/domain/usecases/delete_project.dart' as _i1010;
import '../../features/home/domain/usecases/refresh_project_list.dart' as _i789;
import '../../features/home/domain/usecases/watch_projects_stream.dart'
    as _i1025;
import '../../features/home/presentation/add_project/bloc/new_project_bloc.dart'
    as _i1072;
import '../../features/home/presentation/bloc/projects_bloc.dart' as _i479;
import '../../features/profile/domain/usecases/fetch_user_profile.dart'
    as _i986;
import '../../features/tasks/data/datasources/task_local_data_source.dart'
    as _i505;
import '../../features/tasks/data/datasources/task_remote_data_source.dart'
    as _i864;
import '../../features/tasks/data/model/task_model.dart' as _i515;
import '../../features/tasks/data/repositories/task_repository_impl.dart'
    as _i20;
import '../../features/tasks/domain/repositories/task_repository.dart' as _i148;
import '../../features/tasks/domain/usecases/create_task.dart' as _i602;
import '../../features/tasks/domain/usecases/delete_task.dart' as _i840;
import '../../features/tasks/domain/usecases/refresh_tasks_cache.dart' as _i765;
import '../../features/tasks/domain/usecases/update_task_status.dart' as _i301;
import '../../features/tasks/domain/usecases/watch_tasks_stream.dart' as _i961;
import '../../features/tasks/presentation/add_task/bloc/new_task_bloc.dart'
    as _i576;
import '../../features/tasks/presentation/bloc/tasks_bloc.dart' as _i447;
import '../network/api_client.dart' as _i557;
import '../services/sync/sync_action.dart' as _i599;
import '../services/sync/sync_manager.dart' as _i310;
import '../theme/cubit/theme_cubit.dart' as _i194;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i979.Box<_i341.ProjectModel>>(
      () => registerModule.projectBox,
      preResolve: true,
    );
    await gh.factoryAsync<_i979.Box<_i515.TaskModel>>(
      () => registerModule.taskBox,
      preResolve: true,
    );
    await gh.factoryAsync<_i979.Box<_i599.SyncAction>>(
      () => registerModule.syncActionBox,
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.factory<String>(
      () => registerModule.supabaseAnonKey,
      instanceName: 'supabaseAnonKey',
    );
    gh.lazySingleton<_i505.TaskLocalDataSource>(
      () => _i505.TaskLocalDataSourceImpl(gh<_i979.Box<_i515.TaskModel>>()),
    );
    gh.factory<_i194.ThemeCubit>(
      () => _i194.ThemeCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i842.ProjectLocalDataSource>(
      () =>
          _i842.ProjectLocalDataSourceImpl(gh<_i979.Box<_i341.ProjectModel>>()),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.authDio(gh<String>(instanceName: 'supabaseAnonKey')),
      instanceName: 'authDio',
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i852.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i310.SyncManager>(
      () =>
          _i310.SyncManager(gh<_i979.Box<_i599.SyncAction>>(), gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i864.TaskRemoteDataSource>(
      () => _i864.TaskRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i148.TaskRepository>(
      () => _i20.TaskRepositoryImpl(
        gh<_i864.TaskRemoteDataSource>(),
        gh<_i505.TaskLocalDataSource>(),
        gh<_i895.Connectivity>(),
        gh<_i310.SyncManager>(),
      ),
    );
    gh.factory<_i602.CreateTask>(
      () => _i602.CreateTask(gh<_i148.TaskRepository>()),
    );
    gh.factory<_i840.DeleteTask>(
      () => _i840.DeleteTask(gh<_i148.TaskRepository>()),
    );
    gh.factory<_i765.RefreshTasksCache>(
      () => _i765.RefreshTasksCache(gh<_i148.TaskRepository>()),
    );
    gh.factory<_i301.UpdateTaskStatus>(
      () => _i301.UpdateTaskStatus(gh<_i148.TaskRepository>()),
    );
    gh.factory<_i961.WatchTasksStream>(
      () => _i961.WatchTasksStream(gh<_i148.TaskRepository>()),
    );
    gh.factory<_i576.NewTaskBloc>(
      () => _i576.NewTaskBloc(gh<_i602.CreateTask>()),
    );
    gh.lazySingleton<_i744.ProjectRemoteDataSource>(
      () => _i744.ProjectRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i853.AuthRemoteDataSource>(
      () => _i853.AuthRemoteDataSourceImpl(
        gh<_i557.ApiClient>(),
        gh<_i852.AuthLocalDataSource>(),
        gh<_i361.Dio>(instanceName: 'authDio'),
        gh<String>(instanceName: 'supabaseAnonKey'),
      ),
    );
    gh.lazySingleton<_i447.ProjectRepository>(
      () => _i403.ProjectRepositoryImpl(
        gh<_i744.ProjectRemoteDataSource>(),
        gh<_i842.ProjectLocalDataSource>(),
        gh<_i895.Connectivity>(),
        gh<_i310.SyncManager>(),
      ),
    );
    gh.factory<_i447.ProjectTasksBloc>(
      () => _i447.ProjectTasksBloc(
        watchTasksStream: gh<_i961.WatchTasksStream>(),
        refreshTasksCache: gh<_i765.RefreshTasksCache>(),
        updateTaskStatus: gh<_i301.UpdateTaskStatus>(),
        deleteTask: gh<_i840.DeleteTask>(),
      ),
    );
    gh.factory<_i1010.DeleteProject>(
      () => _i1010.DeleteProject(gh<_i447.ProjectRepository>()),
    );
    gh.factory<_i1015.CreateProject>(
      () => _i1015.CreateProject(gh<_i447.ProjectRepository>()),
    );
    gh.factory<_i789.RefreshProjectList>(
      () => _i789.RefreshProjectList(gh<_i447.ProjectRepository>()),
    );
    gh.factory<_i1025.WatchProjectsStream>(
      () => _i1025.WatchProjectsStream(gh<_i447.ProjectRepository>()),
    );
    gh.lazySingleton<_i723.AuthRepository>(
      () => _i662.AuthRepositoryImpl(
        remoteDataSource: gh<_i853.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i479.ProjectsBloc>(
      () => _i479.ProjectsBloc(
        watchProjectsStream: gh<_i1025.WatchProjectsStream>(),
        createProject: gh<_i1015.CreateProject>(),
        deleteProject: gh<_i1010.DeleteProject>(),
        refreshProjectList: gh<_i789.RefreshProjectList>(),
      ),
    );
    gh.factory<_i1072.NewProjectBloc>(
      () => _i1072.NewProjectBloc(gh<_i1015.CreateProject>()),
    );
    gh.factory<_i467.LoginUseCase>(
      () => _i467.LoginUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i467.SignUpUseCase>(
      () => _i467.SignUpUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i467.LogoutUseCase>(
      () => _i467.LogoutUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i467.CheckAuthStatusUseCase>(
      () => _i467.CheckAuthStatusUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i986.FetchUserProfileUseCase>(
      () => _i986.FetchUserProfileUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i72.UserBloc>(
      () => _i72.UserBloc(
        fetchUserProfileUseCase: gh<_i986.FetchUserProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        loginUseCase: gh<_i467.LoginUseCase>(),
        signUpUseCase: gh<_i467.SignUpUseCase>(),
        logoutUseCase: gh<_i467.LogoutUseCase>(),
        checkAuthStatusUseCase: gh<_i467.CheckAuthStatusUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
