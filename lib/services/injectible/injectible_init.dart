import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../routes/app_router.dart';
import '../../styles/app_theme_data.dart';
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
}
