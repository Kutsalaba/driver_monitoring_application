// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Drivers Monitoring",
  "startAppName": "MILITARY \nTRANSPORT \nSERVICE",
  "termsOfUse": "Terms of use",
  "privacyPolicy": "Privacy Policy",
  "exit": "Exit",
  "home": "HOME",
  "drivers": "DRIVERS",
  "cars": "CARS",
  "help": "HELP",
  "logOut": "LOGOUT"
};
static const Map<String,dynamic> ua = {
  "appName": "Моніторинг водіїв",
  "startAppName": "MILITARY \nTRANSPORT \nSERVICE",
  "termsOfUse": "Правила використання",
  "privacyPolicy": "Політика конфіденційності",
  "exit": "Вихід",
  "home": "HOME",
  "drivers": "DRIVERS",
  "cars": "CARS",
  "help": "HELP",
  "logOut": "LOGOUT"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ua": ua};
}
