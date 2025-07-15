import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class CustomStar extends StatelessWidget {
  const CustomStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          icon: Icon(
            Icons.star,
            size: 16,
            color: ConstantColor.kprimaryBlue,
          ),
        ));
  }
}
