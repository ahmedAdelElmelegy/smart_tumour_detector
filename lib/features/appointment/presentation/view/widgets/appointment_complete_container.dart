import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/appointment_doctor_imageandname.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/appointment_doctor_rateand_favorite.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/re_book_and_review.dart';

class AppointmentCompleteContainer extends StatelessWidget {
  const AppointmentCompleteContainer({
    super.key,
    required this.doctorModel,
  });
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 141.h,
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
          const AppointmentDoctorRateAndFavorite(),
          const SizedBox(height: 9),
          ReBookAndReview(
            doctorModel: doctorModel,
          )
        ],
      ),
    );
  }
}
