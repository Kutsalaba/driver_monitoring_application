import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../routes/app_router.dart';
import '../../styles/app_theme_data.dart';
import '../db_drivers.dart';
import '../db_service.dart';
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
  AppThemeData get appThemeData => AppThemeData();

  @lazySingleton
  DbService get dbService => DbService();

  @lazySingleton
  SecureStorage get secureStorage => SecureStorage();

  @lazySingleton
  DbDrivers get dbDrivers => DbDrivers();
}
