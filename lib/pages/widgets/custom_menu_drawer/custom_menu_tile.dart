import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMenuTile extends StatelessWidget {
  const CustomMenuTile({
    super.key,
    required this.itemText,
    required this.iconPath,
    this.onTap,
  });

  final String itemText;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20.w),
            SvgPicture.asset(iconPath),
            SizedBox(width: 12.w),
            Text(
              itemText,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
