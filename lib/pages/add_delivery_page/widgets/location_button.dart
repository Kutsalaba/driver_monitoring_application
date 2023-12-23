import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../styles/app_colors.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      // width: 60.w,
      color: AppColors.blue,
      child: Row(
        children: [
          SvgPicture.asset(Assets.icons.location),
          Text('Go to map'),
        ],
      ),
    );
  }
}
