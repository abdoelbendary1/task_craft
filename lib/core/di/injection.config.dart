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
import '../../features/home/data/data_source/project_local_data_source.dart'
    as _i217;
import '../../features/home/data/data_source/project_remote_data_source.dart'
    as _i670;
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
import '../../features/home/presentation/bloc/projects_bloc.dart' as _i479;
import '../../features/profile/domain/usecases/fetch_user_profile.dart'
    as _i986;
import '../network/api_client.dart' as _i557;

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
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i217.ProjectLocalDataSource>(
      () =>
          _i217.ProjectLocalDataSourceImpl(gh<_i979.Box<_i341.ProjectModel>>()),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i852.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i670.ProjectRemoteDataSource>(
      () => _i670.ProjectRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i447.ProjectRepository>(
      () => _i403.ProjectRepositoryImpl(
        gh<_i670.ProjectRemoteDataSource>(),
        gh<_i217.ProjectLocalDataSource>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.lazySingleton<_i853.AuthRemoteDataSource>(
      () => _i853.AuthRemoteDataSourceImpl(
        gh<_i361.Dio>(),
        gh<_i852.AuthLocalDataSource>(),
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
    gh.factory<_i467.LoginUseCase>(
      () => _i467.LoginUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i467.SignUpUseCase>(
      () => _i467.SignUpUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i467.LogoutUseCase>(
      () => _i467.LogoutUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i986.FetchUserProfileUseCase>(
      () => _i986.FetchUserProfileUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i72.UserBloc>(
      () => _i72.UserBloc(
        fetchUserProfileUseCase: gh<_i986.FetchUserProfileUseCase>(),
      ),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        loginUseCase: gh<_i467.LoginUseCase>(),
        signUpUseCase: gh<_i467.SignUpUseCase>(),
        logoutUseCase: gh<_i467.LogoutUseCase>(),
        userBloc: gh<_i72.UserBloc>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i557.RegisterModule {}
