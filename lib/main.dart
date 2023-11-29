import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'routes/app_router.dart';
import 'services/injectible/injectible_init.dart';
import 'styles/app_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //LOCALIZATION
  await EasyLocalization.ensureInitialized();

  //GetIt setup
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      path: 'assets/localization',
      startLocale: const Locale('en'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppThemeData().defaultThemeData,
          routerConfig: getIt<AppRouter>().config(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}
