import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class ReBookAndReview extends StatelessWidget {
  const ReBookAndReview({
    super.key,
    this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          width: 116,
          height: 27,
          decoration: BoxDecoration(
            color: ConstantColor.kprimaryWhite,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRoutes.kschudelandpatiendetails,
                extra: doctorModel,
              );
            },
            child: Text(
              "Re-Book",
              style: ConstantText.textstyle20.copyWith(
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 136,
          height: 28,
          decoration: BoxDecoration(
            color: ConstantColor.kprimaryBlue,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRoutes.kAddreview,
                extra: doctorModel,
              );
            },
            child: Text(
              "Add Review",
              style: ConstantText.textstyle20.copyWith(),
            ),
          ),
        )
      ],
    );
  }
}
