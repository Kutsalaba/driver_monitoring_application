// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubit/app_state_cubit.dart' as _i22;
import '../../domain/auth/datasource/auth_datasource.dart' as _i18;
import '../../domain/auth/repository/auth_repo.dart' as _i19;
import '../../domain/auth/repository/auth_repo_impl.dart' as _i20;
import '../../pages/add_delivery_page/cubit/add_delivery_cubit.dart' as _i3;
import '../../pages/add_driver_page/cubit/add_driver_cubit.dart' as _i4;
import '../../pages/add_vehicles_page/cubit/add_vehicle_cubit.dart' as _i5;
import '../../pages/drivers_page/cubit/drivers_cubit.dart' as _i10;
import '../../pages/home_page/cubit/home_cubit.dart' as _i12;
import '../../pages/sign_in_page/cubit/sign_in_cubit.dart' as _i21;
import '../../pages/splash_page/cubit/splash_cubit.dart' as _i15;
import '../../pages/vehicles_page/cubit/vehicles_cubit.dart' as _i16;
import '../../routes/app_router.dart' as _i6;
import '../../styles/app_theme_data.dart' as _i7;
import '../auth_service.dart' as _i8;
import '../deliveries_service.dart' as _i9;
import '../drivers_service.dart' as _i11;
import '../location_service.dart' as _i13;
import '../secure_storage_service.dart' as _i14;
import '../vehicles_service.dart' as _i17;
import 'injectible_init.dart' as _i23;

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
  gh.factory<_i3.AddDeliveryCubit>(() => _i3.AddDeliveryCubit());
  gh.factory<_i4.AddDriverCubit>(() => _i4.AddDriverCubit());
  gh.factory<_i5.AddVehicleCubit>(() => _i5.AddVehicleCubit());
  gh.lazySingleton<_i6.AppRouter>(() => registerModule.appRouter);
  gh.lazySingleton<_i7.AppThemeData>(() => _i7.AppThemeData());
  gh.lazySingleton<_i8.AuthService>(() => registerModule.authService);
  gh.lazySingleton<_i9.DeliveriesService>(
      () => registerModule.deliveriesService);
  gh.factory<_i10.DriversCubit>(() => _i10.DriversCubit());
  gh.lazySingleton<_i11.DriversService>(() => registerModule.driversService);
  gh.factory<_i12.HomeCubit>(() => _i12.HomeCubit());
  gh.lazySingleton<_i13.LocationService>(() => registerModule.locationService);
  gh.lazySingleton<_i14.SecureStorage>(() => registerModule.secureStorage);
  gh.factory<_i15.SplashCubit>(() => _i15.SplashCubit());
  gh.factory<_i16.VehiclesCubit>(() => _i16.VehiclesCubit());
  gh.lazySingleton<_i17.VehiclesService>(() => registerModule.vehiclesService);
  gh.factory<_i18.AuthDataSourceI>(
      () => _i18.AuthDataSourceImpl(dbService: gh<_i8.AuthService>()));
  gh.factory<_i19.AuthRepositoryI>(
      () => _i20.AuthRepositoryImplementation(gh<_i18.AuthDataSourceI>()));
  gh.factory<_i21.SignInCubit>(
      () => _i21.SignInCubit(gh<_i19.AuthRepositoryI>()));
  gh.factory<_i22.AppStateCubit>(() => _i22.AppStateCubit(
        authRepository: gh<_i19.AuthRepositoryI>(),
        dbService: gh<_i8.AuthService>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i23.RegisterModule {}
