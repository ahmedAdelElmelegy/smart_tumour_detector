import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';

class FavoreiteAndInfo extends StatelessWidget {
  const FavoreiteAndInfo({super.key, required this.doctorModel});
final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kprofilepage,extra: doctorModel);
            },
            child: CircleAvatar(
              backgroundColor: ConstantColor.kprimaryWhite,
              radius: 9,
              child: Icon(
                Icons.question_mark,
                size: 15,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            backgroundColor: ConstantColor.kprimaryWhite,
            radius: 9,
            child: Icon(
              Icons.favorite,
              size: 15,
              color: ConstantColor.kprimaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
