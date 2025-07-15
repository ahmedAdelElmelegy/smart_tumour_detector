
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_star.dart';

class StarAndComment extends StatelessWidget {
  const StarAndComment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const CustomStar(),
          SizedBox(width: 5.w),
          SizedBox(
              width: 43.w,
              height: 18.h,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantColor.kprimaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  label: ConstantText.getTextWidget(
                    '5',
                    FontWeight.w300,
                    12,
                    ConstantColor.kprimaryBlue,
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/comments31.svg',
                    width: 14.w,
                    height: 14.h,
                  ))),
        ],
      ),
    );
  }
}
