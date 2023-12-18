// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubit/app_state_cubit.dart' as _i17;
import '../../domain/auth/datasource/auth_datasource.dart' as _i13;
import '../../domain/auth/repository/auth_repo.dart' as _i14;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i15;
import '../../pages/add_driver_page/cubit/add_driver_cubit.dart' as _i3;
import '../../pages/drivers_page/cubit/drivers_cubit.dart' as _i7;
import '../../pages/sign_in_page/cubit/sign_in_cubit.dart' as _i16;
import '../../pages/splash_page/cubit/splash_cubit.dart' as _i10;
import '../../pages/vehicles_page/cubit/vehicles_cubit.dart' as _i11;
import '../../routes/app_router.dart' as _i4;
import '../../styles/app_theme_data.dart' as _i5;
import '../auth_service.dart' as _i6;
import '../drivers_service.dart' as _i8;
import '../secure_storage_service.dart' as _i9;
import '../vehicles_service.dart' as _i12;
import 'injectible_init.dart' as _i18;

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
  gh.lazySingleton<_i6.AuthService>(() => registerModule.authService);
  gh.factory<_i7.DriversCubit>(() => _i7.DriversCubit());
  gh.lazySingleton<_i8.DriversService>(() => registerModule.driversService);
  gh.lazySingleton<_i9.SecureStorage>(() => registerModule.secureStorage);
  gh.factory<_i10.SplashCubit>(() => _i10.SplashCubit());
  gh.factory<_i11.VehiclesCubit>(() => _i11.VehiclesCubit());
  gh.lazySingleton<_i12.VehiclesService>(() => registerModule.vehiclesService);
  gh.factory<_i13.AuthDataSourceI>(
      () => _i13.AuthDataSourceImpl(dbService: gh<_i6.AuthService>()));
  gh.factory<_i14.AuthRepositoryI>(
      () => _i15.AuthRepositoryImplementation(gh<_i13.AuthDataSourceI>()));
  gh.factory<_i16.SignInCubit>(
      () => _i16.SignInCubit(gh<_i14.AuthRepositoryI>()));
  gh.factory<_i17.AppStateCubit>(() => _i17.AppStateCubit(
        authRepository: gh<_i14.AuthRepositoryI>(),
        dbService: gh<_i6.AuthService>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i18.RegisterModule {}
