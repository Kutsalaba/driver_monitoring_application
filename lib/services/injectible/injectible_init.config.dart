// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubit/app_state_cubit.dart' as _i12;
import '../../domain/auth/datasource/auth_datasource.dart' as _i8;
import '../../domain/auth/repository/auth_repo.dart' as _i9;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i10;
import '../../pages/auth_page/cubit/sign_in_cubit.dart' as _i11;
import '../../pages/splash/cubit/splash_cubit.dart' as _i7;
import '../../routes/app_router.dart' as _i3;
import '../../styles/app_theme_data.dart' as _i4;
import '../db_service.dart' as _i5;
import '../secure_storage_service.dart' as _i6;
import 'injectible_init.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter);
  gh.lazySingleton<_i4.AppThemeData>(() => registerModule.appThemeData);
  gh.lazySingleton<_i5.DbService>(() => registerModule.dbService);
  gh.lazySingleton<_i6.SecureStorage>(() => registerModule.secureStorage);
  gh.factory<_i7.SplashCubit>(() => _i7.SplashCubit());
  gh.factory<_i8.AuthDataSourceI>(
      () => _i8.AuthDataSourceImpl(dbService: gh<_i5.DbService>()));
  gh.factory<_i9.AuthRepositoryI>(
      () => _i10.AuthRepositoryImplementation(gh<_i8.AuthDataSourceI>()));
  gh.factory<_i11.SignInCubit>(
      () => _i11.SignInCubit(gh<_i9.AuthRepositoryI>()));
  gh.factory<_i12.AppStateCubit>(() => _i12.AppStateCubit(
        authRepository: gh<_i9.AuthRepositoryI>(),
        dbService: gh<_i5.DbService>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
