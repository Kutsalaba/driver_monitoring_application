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
  "orders": "ORDERS",
  "drivers": "DRIVERS",
  "vehicles": "VEHICLES",
  "support": "SUPPORT",
  "logOut": "LOGOUT",
  "fieldsCannotBeEmpty": "Fields cannot be empty!",
  "addDriver": "Add a driver",
  "createDelivery": "Create a delivery",
  "notCorrectLoginOrPassword": "Not correct login or password"
};
static const Map<String,dynamic> ua = {
  "appName": "Моніторинг водіїв",
  "startAppName": "MILITARY \nTRANSPORT \nSERVICE",
  "termsOfUse": "Правила використання",
  "privacyPolicy": "Політика конфіденційності",
  "exit": "ВИХІД",
  "orders": "НАКАЗИ",
  "drivers": "ВОДІЇ",
  "vehicles": "ТРАНСПОРТ",
  "support": "ПІДТРИМКА",
  "logOut": "ВИХІД",
  "fieldsCannotBeEmpty": "Поля не можуть бути пустими!",
  "addDriver": "Додати водія",
  "createDelivery": "Створити наказ",
  "notCorrectLoginOrPassword": "Не правильний логін або пароль"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ua": ua};
}
