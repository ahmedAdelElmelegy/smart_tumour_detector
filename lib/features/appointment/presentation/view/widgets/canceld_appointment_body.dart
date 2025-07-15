import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/appointment_doctor_imageandname.dart';

class CanceldAppointmentBody extends StatelessWidget {
  const CanceldAppointmentBody({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 131.h,
      decoration: BoxDecoration(
        color: ConstantColor.kprimaryLightBlue,
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DoctorImageAndName(
            doctorModel: doctorModel,
          ),
          const SizedBox(height: 12),
          Container(
            alignment: Alignment.center,
            width: 248.w,
            height: 27.h,
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
                style: ConstantText.textstyle20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
