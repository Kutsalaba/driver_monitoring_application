import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/custom_menu_drawer/custom_menu_drawer.dart';

@RoutePage()
class GeoMapsPage extends StatefulWidget {
  const GeoMapsPage({super.key});

  @override
  State<GeoMapsPage> createState() => _GeoMapsPageState();
}

class _GeoMapsPageState extends State<GeoMapsPage> {
  String locationMessage = 'Current Location of the User';
  late String lat;
  late String long;

  //Get current location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  //Listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });

    setState(() {
      locationMessage = 'Latitude: $lat , Longitude: $long';
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    var canLaunch = await canLaunchUrl(Uri.parse(googleURL));
    log(Uri.parse(googleURL).toString());
    await launchUrlString(googleURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brightGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Text(locationMessage),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                await _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'Latitude: $lat, Longitude: $long';
                  });
                  _liveLocation();
                });
              },
              child: Text('Get current location'),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: Text('On map location'),
            ),
          ],
        ),
      ),
      drawer: CustomMenuDrawer(),
    );
  }
}
