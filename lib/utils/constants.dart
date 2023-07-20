import 'package:flutter/material.dart';

class AssetManager {
  static String imagesDir = 'assets/imgs';
  static String dataDir = 'assets/data';

  static final String loginImg = '$imagesDir/login_.jpg';
  static final String profileImg = '$imagesDir/avatar.jpg';
  static final String orderJson = '$dataDir/order.json';
}

class Constants {
  static const double smallPadding = 8;
  static const double mediumPadding = 16;
  static const double largePadding = 32;
  static const double borderRadius = 10;
  static const primaryColor = Colors.amber;
  static Color priceColor = Colors.green[800]!;
}
