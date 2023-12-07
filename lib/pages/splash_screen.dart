import 'package:auto_route/auto_route.dart';
import 'package:driver_monitoring_application/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../routes/app_router.gr.dart';
import '../styles/app_colors.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future startAnimation(context) async {
    await Future.delayed(const Duration(seconds: 3));
    AutoRouter.of(context).replace(const AuthRoute());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contrastBlack,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.logo.image(
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    LocaleKeys.startAppName.tr(),
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Supported by',
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
