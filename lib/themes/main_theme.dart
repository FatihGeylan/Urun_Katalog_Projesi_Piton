import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi_piton/constants/color_constants.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: TextTheme(subtitle1: GoogleFonts.manrope(
      fontSize: 16.sp,fontWeight: FontWeight.w400,color: ColorConstants.blackTextColor)
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    filled: true,
    fillColor: const Color(0xFFF4F4FF),
    hintStyle: GoogleFonts.manrope(
      color: ColorConstants.blackTextColor.withOpacity(0.4),
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w)
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: ColorConstants.darkPurpleColor,width: 2),
    fillColor: MaterialStateProperty.all(ColorConstants.darkPurpleColor)
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorConstants.lightPurpleColor
    )
  )


);
