import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/gen/assets.gen.dart';
import 'package:driver_monitoring_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    required this.markerId,
  });

  final String markerId;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController? mapController;
  LatLng? tempLatLng;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onTap: (LatLng latLng) {
            setState(() {
              tempLatLng = latLng;
            });
          },
          onMapCreated: onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(50.436866, 30.534543),
            zoom: 11.0,
          ),
          markers: {
            if (tempLatLng != null)
              Marker(
                markerId: MarkerId(widget.markerId),
                position: tempLatLng!,
              ),
          },
        ),
        Visibility(
          visible: tempLatLng != null,
          child: Positioned(
            bottom: 120.h,
            right: 10.w,
            child: FloatingActionButton(
              backgroundColor: AppColors.blue,
              child: SvgPicture.asset(Assets.icons.done),
              onPressed: () async {
                var router = AutoRouter.of(context);
                if (tempLatLng != null) {
                  await router.pop(tempLatLng);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
