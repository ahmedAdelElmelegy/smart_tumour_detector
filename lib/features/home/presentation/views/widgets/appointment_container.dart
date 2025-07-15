import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/aappointment.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/date.dart';

class AappointmentContainer extends StatelessWidget {
  const AappointmentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      constraints: BoxConstraints(minHeight: 230.h, maxHeight: 250.h),
      color: ConstantColor.kprimaryLightBlue,
      child: ListView(
        children: [
          const Date(),
          SizedBox(height: 10.h),
          const Aappointment(),
        ],
      ),
    );
  }
}
