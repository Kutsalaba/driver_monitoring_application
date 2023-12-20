// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubit/app_state_cubit.dart' as _i18;
import '../../domain/auth/datasource/auth_datasource.dart' as _i14;
import '../../domain/auth/repository/auth_repo.dart' as _i15;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i16;
import '../../pages/add_driver_page/cubit/add_driver_cubit.dart' as _i3;
import '../../pages/add_vehicles_page/cubit/add_vehicle_cubit.dart' as _i4;
import '../../pages/drivers_page/cubit/drivers_cubit.dart' as _i8;
import '../../pages/sign_in_page/cubit/sign_in_cubit.dart' as _i17;
import '../../pages/splash_page/cubit/splash_cubit.dart' as _i11;
import '../../pages/vehicles_page/cubit/vehicles_cubit.dart' as _i12;
import '../../routes/app_router.dart' as _i5;
import '../../styles/app_theme_data.dart' as _i6;
import '../auth_service.dart' as _i7;
import '../drivers_service.dart' as _i9;
import '../secure_storage_service.dart' as _i10;
import '../vehicles_service.dart' as _i13;
import 'injectible_init.dart' as _i19;

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
  gh.factory<_i4.AddVehicleCubit>(() => _i4.AddVehicleCubit());
  gh.lazySingleton<_i5.AppRouter>(() => registerModule.appRouter);
  gh.lazySingleton<_i6.AppThemeData>(() => registerModule.appThemeData);
  gh.lazySingleton<_i7.AuthService>(() => registerModule.authService);
  gh.factory<_i8.DriversCubit>(() => _i8.DriversCubit());
  gh.lazySingleton<_i9.DriversService>(() => registerModule.driversService);
  gh.lazySingleton<_i10.SecureStorage>(() => registerModule.secureStorage);
  gh.factory<_i11.SplashCubit>(() => _i11.SplashCubit());
  gh.factory<_i12.VehiclesCubit>(() => _i12.VehiclesCubit());
  gh.lazySingleton<_i13.VehiclesService>(() => registerModule.vehiclesService);
  gh.factory<_i14.AuthDataSourceI>(
      () => _i14.AuthDataSourceImpl(dbService: gh<_i7.AuthService>()));
  gh.factory<_i15.AuthRepositoryI>(
      () => _i16.AuthRepositoryImplementation(gh<_i14.AuthDataSourceI>()));
  gh.factory<_i17.SignInCubit>(
      () => _i17.SignInCubit(gh<_i15.AuthRepositoryI>()));
  gh.factory<_i18.AppStateCubit>(() => _i18.AppStateCubit(
        authRepository: gh<_i15.AuthRepositoryI>(),
        dbService: gh<_i7.AuthService>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i19.RegisterModule {}
