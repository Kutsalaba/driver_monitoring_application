import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddDeliveryRoute.page),
        AutoRoute(page: DriversRoute.page),
        AutoRoute(page: AddDriverRoute.page),
        AutoRoute(page: VehiclesRoute.page),
        AutoRoute(page: AddVehicleRoute.page),
        AutoRoute(page: SupportRoute.page),
      ];
}
