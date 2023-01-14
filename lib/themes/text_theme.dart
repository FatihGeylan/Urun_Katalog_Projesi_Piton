import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class CustomTextStyle {
  static TextStyle headline1 = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: ColorConstants.blackTextColor
  );

  static TextStyle headline2 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor.withOpacity(0.6)
  );
  static TextStyle headline3 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor
  );
  static TextStyle headline4 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ColorConstants.whiteColor
  );
  static TextStyle headline5 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.whiteColor
  );
  static TextStyle headline6 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorConstants.blackTextColor.withOpacity(0.6)
  );
  static TextStyle headline7 = GoogleFonts.manrope(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: ColorConstants.darkPurpleColor
  );
  static TextStyle subtitle1 = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: ColorConstants.darkPurpleColor,
  );
  static TextStyle subtitle2 = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor,
  );
  static TextStyle subtitle3 = GoogleFonts.manrope(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor.withOpacity(0.6),
  );
  static TextStyle subtitle4 = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ColorConstants.darkPurpleColor,
  );
  static TextStyle subtitle5 = GoogleFonts.manrope(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor,
  );
  static TextStyle subtitle6 = GoogleFonts.manrope(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: ColorConstants.blackTextColor.withOpacity(0.6),
  );
  static TextStyle subtitle7 = GoogleFonts.manrope(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstants.blackTextColor
  );
  static TextStyle subtitle8 = GoogleFonts.manrope(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstants.blackTextColor.withOpacity(0.4)
  );
  static TextStyle subtitle9 = GoogleFonts.manrope(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: ColorConstants.orangeColor
  );




  // static TextStyle hint1 = GoogleFonts.roboto(
  //   fontSize: 20.sp,
  //   fontWeight: FontWeight.w400,
  //   color: Colors.grey,
  // );
  //
  // static TextStyle subtitle1colorize = GoogleFonts.roboto(
  //     fontSize: 30.sp,
  //     fontWeight: FontWeight.bold,
  //     color: const Color(0xff5B5B5B));
  // static TextStyle checkbox = GoogleFonts.roboto(
  //     fontSize: 18,
  //     fontWeight: FontWeight.w400,
  //     color: ColorConstants.instance.kCheckBoxTextColor);
}
