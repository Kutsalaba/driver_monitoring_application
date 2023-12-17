// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:driver_monitoring_application/pages/add_driver_page/add_driver_page.dart'
    as _i1;
import 'package:driver_monitoring_application/pages/add_vehicles_page/add_vehicle_page.dart'
    as _i2;
import 'package:driver_monitoring_application/pages/drivers_page/drivers_page.dart'
    as _i3;
import 'package:driver_monitoring_application/pages/home_page/home_page.dart'
    as _i4;
import 'package:driver_monitoring_application/pages/sign_in_page/sign_in_page.dart'
    as _i5;
import 'package:driver_monitoring_application/pages/splash_page/splash_page.dart'
    as _i6;
import 'package:driver_monitoring_application/pages/support_page/support_page.dart'
    as _i7;
import 'package:driver_monitoring_application/pages/vehicles_page/vehicles_page.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddDriverRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddDriverPage(),
      );
    },
    AddVehicleRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddVehiclePage(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DriversPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
    SupportRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SupportPage(),
      );
    },
    VehiclesRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.VehiclesPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddDriverPage]
class AddDriverRoute extends _i9.PageRouteInfo<void> {
  const AddDriverRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AddDriverRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDriverRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddVehiclePage]
class AddVehicleRoute extends _i9.PageRouteInfo<void> {
  const AddVehicleRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AddVehicleRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddVehicleRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DriversPage]
class DriversRoute extends _i9.PageRouteInfo<void> {
  const DriversRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SupportPage]
class SupportRoute extends _i9.PageRouteInfo<void> {
  const SupportRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.VehiclesPage]
class VehiclesRoute extends _i9.PageRouteInfo<void> {
  const VehiclesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          VehiclesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VehiclesRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
