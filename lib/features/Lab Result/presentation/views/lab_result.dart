import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/Lab%20Result/presentation/views/widgets/parent_lab_resultcontainer.dart';

class LabResult extends StatelessWidget {
  const LabResult({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ConstantColor.kprimaryLabbackResult,
            ConstantColor.kprimaryUploadButton,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 58.0.w),
            child: Image.asset(
              "assets/images/Ellipse7.png",
              width: 312.w,
              height: 311.h,
            ),
          ),
          Positioned(
            left: 99.w,
            top: 23.h,
            child: Image.asset(
              "assets/images/Ellipse6.png",
              width: 229.w,
              height: 229.h,
            ),
          ),
          Positioned(
            left: 119.w,
            top: 23.h,
            child: Image.asset(
              "assets/images/microskop.png",
              width: 194.w,
              height: 196.h,
            ),
          ),
          Positioned(
            top: 219.h,
            child: ParentLabResultContainer(result: result),
          ),
          Positioned(
            top: 564.h,
            left: 142.w,
            child: Text(
              "Results",
              style: ConstantText.textstyle22,
            ),
          ),
          Positioned(
            top: 44.h,
            left: 281.w,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: ConstantColor.kCloseButton,
              child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: ConstantColor.kprimaryWhite,
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
