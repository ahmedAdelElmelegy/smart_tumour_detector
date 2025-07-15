import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_star.dart';

class AppointmentDoctorRateAndFavorite extends StatelessWidget {
  const AppointmentDoctorRateAndFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomStar(),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: ConstantColor.kprimaryWhite,
          radius: 10.5,
          child: Icon(
            Icons.favorite,
            size: 15,
            color: ConstantColor.kprimaryBlue,
          ),
        ),
      ],
    );
  }
}