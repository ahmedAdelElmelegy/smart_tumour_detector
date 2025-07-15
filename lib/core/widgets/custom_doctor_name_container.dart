import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class CustomDoctorNameContainer extends StatelessWidget {
  const CustomDoctorNameContainer({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });
  final double width;
  final double height;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: ConstantColor.kprimaryWhite,
            borderRadius: BorderRadius.circular(13.r)),
        child: text);
  }
}
