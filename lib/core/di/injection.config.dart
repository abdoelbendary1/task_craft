// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/auth_remote_data_surce.dart'
    as _i853;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/auth_useCases.dart' as _i467;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/bloc/user_bloc/user_bloc.dart' as _i72;
import '../../features/home/presentation/bloc/projects_bloc.dart' as _i479;
import '../../features/profile/domain/usecases/fetch_user_profile.dart'
    as _i986;
import '../network/api_client.dart' as _i557;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i479.ProjectsBloc>(() => _i479.ProjectsBloc());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i853.AuthRemoteDataSource>(
      () => _i853.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i723.AuthRepository>(
      () => _i662.AuthRepositoryImpl(
        remoteDataSource: gh<_i853.AuthRemoteDataSource>(),
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
