import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/star_and_comment.dart';

class DoctorInfoAvelapileTime extends StatelessWidget {
  const DoctorInfoAvelapileTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const StarAndComment(),
        const SizedBox(width: 5),
        CustomDoctorNameContainer(
          width: 198,
          height: 18,
          text: Row(
            children: [
              SvgPicture.asset(
                "assets/images/alarm.svg",
              ),
              const SizedBox(width: 4),
              Text(
                "Mon-Sat / 9:00AM - 5:00PM",
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: ConstantText.textstyle12.copyWith(
                  color: ConstantColor.kprimaryBlue,
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
