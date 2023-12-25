// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:driver_monitoring_application/models/delivery_model.dart'
    as _i14;
import 'package:driver_monitoring_application/pages/add_delivery_page/add_delivery_page.dart'
    as _i1;
import 'package:driver_monitoring_application/pages/add_delivery_page/widgets/map_page.dart'
    as _i7;
import 'package:driver_monitoring_application/pages/add_driver_page/add_driver_page.dart'
    as _i2;
import 'package:driver_monitoring_application/pages/add_vehicles_page/add_vehicle_page.dart'
    as _i3;
import 'package:driver_monitoring_application/pages/drivers_page/drivers_page.dart'
    as _i4;
import 'package:driver_monitoring_application/pages/home_page/home_page.dart'
    as _i5;
import 'package:driver_monitoring_application/pages/home_page/widgets/map_check_page.dart'
    as _i6;
import 'package:driver_monitoring_application/pages/sign_in_page/sign_in_page.dart'
    as _i8;
import 'package:driver_monitoring_application/pages/splash_page/splash_page.dart'
    as _i9;
import 'package:driver_monitoring_application/pages/support_page/support_page.dart'
    as _i10;
import 'package:driver_monitoring_application/pages/vehicles_page/vehicles_page.dart'
    as _i11;
import 'package:flutter/material.dart' as _i13;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i15;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddDeliveryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddDeliveryPage(),
      );
    },
    AddDriverRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddDriverPage(),
      );
    },
    AddVehicleRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddVehiclePage(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DriversPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    MapCheckRoute.name: (routeData) {
      final args = routeData.argsAs<MapCheckRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MapCheckPage(
          key: args.key,
          delivery: args.delivery,
          vehiclePosition: args.vehiclePosition,
        ),
      );
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MapPage(
          key: args.key,
          markerId: args.markerId,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    SupportRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SupportPage(),
      );
    },
    VehiclesRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.VehiclesPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddDeliveryPage]
class AddDeliveryRoute extends _i12.PageRouteInfo<void> {
  const AddDeliveryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDeliveryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddDriverPage]
class AddDriverRoute extends _i12.PageRouteInfo<void> {
  const AddDriverRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddDriverRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDriverRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddVehiclePage]
class AddVehicleRoute extends _i12.PageRouteInfo<void> {
  const AddVehicleRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddVehicleRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddVehicleRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DriversPage]
class DriversRoute extends _i12.PageRouteInfo<void> {
  const DriversRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MapCheckPage]
class MapCheckRoute extends _i12.PageRouteInfo<MapCheckRouteArgs> {
  MapCheckRoute({
    _i13.Key? key,
    required _i14.DeliveryModel delivery,
    _i15.LatLng? vehiclePosition,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MapCheckRoute.name,
          args: MapCheckRouteArgs(
            key: key,
            delivery: delivery,
            vehiclePosition: vehiclePosition,
          ),
          initialChildren: children,
        );

  static const String name = 'MapCheckRoute';

  static const _i12.PageInfo<MapCheckRouteArgs> page =
      _i12.PageInfo<MapCheckRouteArgs>(name);
}

class MapCheckRouteArgs {
  const MapCheckRouteArgs({
    this.key,
    required this.delivery,
    this.vehiclePosition,
  });

  final _i13.Key? key;

  final _i14.DeliveryModel delivery;

  final _i15.LatLng? vehiclePosition;

  @override
  String toString() {
    return 'MapCheckRouteArgs{key: $key, delivery: $delivery, vehiclePosition: $vehiclePosition}';
  }
}

/// generated route for
/// [_i7.MapPage]
class MapRoute extends _i12.PageRouteInfo<MapRouteArgs> {
  MapRoute({
    _i13.Key? key,
    required String markerId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            markerId: markerId,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const _i12.PageInfo<MapRouteArgs> page =
      _i12.PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.markerId,
  });

  final _i13.Key? key;

  final String markerId;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, markerId: $markerId}';
  }
}

/// generated route for
/// [_i8.SignInPage]
class SignInRoute extends _i12.PageRouteInfo<void> {
  const SignInRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SupportPage]
class SupportRoute extends _i12.PageRouteInfo<void> {
  const SupportRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.VehiclesPage]
class VehiclesRoute extends _i12.PageRouteInfo<void> {
  const VehiclesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          VehiclesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VehiclesRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
