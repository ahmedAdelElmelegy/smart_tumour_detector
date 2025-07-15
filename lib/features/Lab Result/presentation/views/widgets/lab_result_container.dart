import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/Lab%20Result/presentation/views/widgets/lab_show_result.dart';

class LabresultContainer extends StatelessWidget {
  const LabresultContainer({super.key, required this.result});
final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      width: 312.w,
      height: 225.h,
      decoration: BoxDecoration(
        color: ConstantColor.kprimaryWhite,
        borderRadius: BorderRadius.circular(38.r),
      ),
      child: Column(
        children: [
           LabShowResult(result: result),
          SizedBox(height: 8.h),
          Text(
            "Rate this service",
            style: ConstantText.textstyle18,
          ),
          SizedBox(height: 20.h),
          SimpleStarRating(
            nonFilledIcon: const Icon(
              Icons.star_border_outlined,
              color: Colors.amber,
              size: 44,
            ),
            filledIcon: const Icon(
              Icons.star,
              color: Colors.amber,
              size: 44,
            ),
            isReadOnly: false,
            allowHalfRating: true,
            starCount: 5,
            rating: 0,
            onRated: (rate) {},
            spacing: 10,
          )
        ],
      ),
    );
  }
}
