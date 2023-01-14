import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color splashBackgroundColor = Color(0xFF1D1D4E);
  static const Color blackTextColor = Color(0xFF090937);
  static const Color darkPurpleColor = Color(0xFF6251DD);
  static const Color lightPurpleColor = Color(0xFFF4F4FF);
  static const Color orangeColor = Color(0xFFEF6B4A);
  ColorConstants._init();
}