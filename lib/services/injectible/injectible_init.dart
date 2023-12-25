import 'package:driver_monitoring_application/services/vehicles_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../routes/app_router.dart';
import '../auth_service.dart';
import '../deliveries_service.dart';
import '../drivers_service.dart';
import '../location_service.dart';
import '../secure_storage_service.dart';
import 'injectible_init.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  AuthService get authService => AuthService();

  @lazySingleton
  SecureStorage get secureStorage => SecureStorage();

  @lazySingleton
  DriversService get driversService => DriversService();

  @lazySingleton
  VehiclesService get vehiclesService => VehiclesService();

  @lazySingleton
  DeliveriesService get deliveriesService => DeliveriesService();

  @lazySingleton
  LocationService get locationService => LocationService();
}
