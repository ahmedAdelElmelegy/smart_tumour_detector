import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Maskgroup.png",
            width: 40.w,
            height: 40.h,
          ),
          Column(
            children: [
              ConstantText.getTextWidget("Hi, WelcomeBack", FontWeight.w300, 12,
                  ConstantColor.kprimaryBlue),
              ConstantText.getTextWidget(
                  "JohnDoe", FontWeight.w400, 14, ConstantColor.kprimaryBlack)
            ],
          ),
        ],
      ),
    );
  }
}
