import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class LabShowResult extends StatelessWidget {
  const LabShowResult({
    super.key,
    required this.result,
  });
  final String result;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 20.w),
          child: Text(
            "your results :",
            style: ConstantText.textstyle18,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30.h, left: 20.w),
          width: 138.w,
          height: 43.h,
          color: ConstantColor.kprimaryResult,
          child: Text(result),
        )
      ],
    );
  }
}
