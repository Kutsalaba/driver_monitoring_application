import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/delivery_model.dart';

@RoutePage()
class MapCheckPage extends StatefulWidget {
  const MapCheckPage({
    super.key,
    required this.delivery,
    this.vehiclePosition,
  });

  final DeliveryModel delivery;
  final LatLng? vehiclePosition;

  @override
  State<MapCheckPage> createState() => _MapCheckPageState();
}

class _MapCheckPageState extends State<MapCheckPage> {
  late GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.vehiclePosition.toString());
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          onTap: (_) {},
          initialCameraPosition: CameraPosition(
            target: widget.vehiclePosition ?? const LatLng(50.436866, 30.534543),
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('selectFromLatLng'),
              position: LatLng(
                widget.delivery.shipFromLatitude!,
                widget.delivery.shipFromLongitude!,
              ),
            ),
            Marker(
              markerId: const MarkerId('selectToLatLng'),
              position: LatLng(
                widget.delivery.shipToLatitude,
                widget.delivery.shipToLongitude,
              ),
            ),
            if (widget.vehiclePosition != null)
              Marker(
                markerId: const MarkerId('vehicleLocation'),
                position: widget.vehiclePosition!,
              ),
          },
        ),
      ],
    );
  }

  Future<void> getLocationUpdates() async {}
}
