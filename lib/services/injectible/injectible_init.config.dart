// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubit/app_state_cubit.dart' as _i14;
import '../../domain/auth/datasource/auth_datasource.dart' as _i10;
import '../../domain/auth/repository/auth_repo.dart' as _i11;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i12;
import '../../pages/add_driver_page/cubit/add_driver_cubit.dart' as _i3;
import '../../pages/sign_in_page/cubit/sign_in_cubit.dart' as _i13;
import '../../pages/splash/cubit/splash_cubit.dart' as _i9;
import '../../routes/app_router.dart' as _i4;
import '../../styles/app_theme_data.dart' as _i5;
import '../db_drivers.dart' as _i6;
import '../db_service.dart' as _i7;
import '../secure_storage_service.dart' as _i8;
import 'injectible_init.dart' as _i15;

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
  gh.factory<_i3.AddDriverCubit>(() => _i3.AddDriverCubit());
  gh.lazySingleton<_i4.AppRouter>(() => registerModule.appRouter);
  gh.lazySingleton<_i5.AppThemeData>(() => registerModule.appThemeData);
  gh.lazySingleton<_i6.DbDrivers>(() => registerModule.dbDrivers);
  gh.lazySingleton<_i7.DbService>(() => registerModule.dbService);
  gh.lazySingleton<_i8.SecureStorage>(() => registerModule.secureStorage);
  gh.factory<_i9.SplashCubit>(() => _i9.SplashCubit());
  gh.factory<_i10.AuthDataSourceI>(
      () => _i10.AuthDataSourceImpl(dbService: gh<_i7.DbService>()));
  gh.factory<_i11.AuthRepositoryI>(
      () => _i12.AuthRepositoryImplementation(gh<_i10.AuthDataSourceI>()));
  gh.factory<_i13.SignInCubit>(
      () => _i13.SignInCubit(gh<_i11.AuthRepositoryI>()));
  gh.factory<_i14.AppStateCubit>(() => _i14.AppStateCubit(
        authRepository: gh<_i11.AuthRepositoryI>(),
        dbService: gh<_i7.DbService>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
