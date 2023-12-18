/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/car.svg
  String get car => 'assets/icons/car.svg';

  /// File path: assets/icons/circle_plus.svg
  String get circlePlus => 'assets/icons/circle_plus.svg';

  /// File path: assets/icons/close_red.svg
  String get closeRed => 'assets/icons/close_red.svg';

  /// File path: assets/icons/driver.svg
  String get driver => 'assets/icons/driver.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/log_out.svg
  String get logOut => 'assets/icons/log_out.svg';

  /// File path: assets/icons/picture_add.svg
  String get pictureAdd => 'assets/icons/picture_add.svg';

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// File path: assets/icons/support.svg
  String get support => 'assets/icons/support.svg';

  /// File path: assets/icons/warning.svg
  String get warning => 'assets/icons/warning.svg';

  /// List of all assets
  List<String> get values => [
        car,
        circlePlus,
        closeRed,
        driver,
        home,
        location,
        logOut,
        pictureAdd,
        success,
        support,
        warning
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/default_car.jpg
  AssetGenImage get defaultCar =>
      const AssetGenImage('assets/images/default_car.jpg');

  /// File path: assets/images/default_driver.jpg
  AssetGenImage get defaultDriver =>
      const AssetGenImage('assets/images/default_driver.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [defaultCar, defaultDriver];
}

class $AssetsLocalizationGen {
  const $AssetsLocalizationGen();

  /// File path: assets/localization/en.json
  String get en => 'assets/localization/en.json';

  /// File path: assets/localization/ua.json
  String get ua => 'assets/localization/ua.json';

  /// List of all assets
  List<String> get values => [en, ua];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalizationGen localization = $AssetsLocalizationGen();
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
