import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantColor {
  static Color kprimaryBlue = const Color(0xff2260FF);
  static Color kprimaryLightBlue = const Color(0xffCAD6FF);
  static Color kprimaryWhite = const Color(0xffffffff);
  static Color kprimaryBlack = const Color(0xff000000);
  static Color kprimaryUploadButton = const Color(0xff00278C);
  static Color kprimaryLabbackResult = const Color(0xff5ED2D2);
  static Color kprimaryResult = const Color(0xffD9D9D9);
  static Color kprimaryCancelAppointmentDescrption = const Color(0xff809CFF);
  static Color kprimaryCancelAppointmentTextField = const Color(0xffECF1FF);
  static const Color kCloseButton = Color.fromRGBO(94, 210, 183, 0.7);
}

class ConstantText {
  static Text getTextWidget(
      String text, FontWeight fontWeight, double fontSize, Color color,
      [TextAlign? align]) {
    return Text(
      text,
      style: GoogleFonts.leagueSpartan(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
      textAlign: align,
    );
  }

  static TextStyle textstyle22 = GoogleFonts.workSans(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: ConstantColor.kprimaryBlack,
  );
  static TextStyle textstyle18 = GoogleFonts.workSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ConstantColor.kprimaryBlack,
  );
  static TextStyle textstyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: ConstantColor.kprimaryBlue,
  );
  static TextStyle textstyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: ConstantColor.kprimaryBlack,
  );
  static TextStyle textstyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ConstantColor.kprimaryBlue,
  );
  static TextStyle textstyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: ConstantColor.kprimaryBlack,
  );
  static TextStyle textstyle15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: ConstantColor.kprimaryWhite,
  );
  static TextStyle textstyle13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: ConstantColor.kprimaryBlack,
  );
  static TextStyle textstyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: ConstantColor.kprimaryWhite,
  );
}
