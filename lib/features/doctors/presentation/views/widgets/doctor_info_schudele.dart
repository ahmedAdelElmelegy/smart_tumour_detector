import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class DoctorInfoScheduel extends StatelessWidget {
  const DoctorInfoScheduel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 23,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ConstantColor.kprimaryBlue,
          iconColor: ConstantColor.kprimaryWhite,
        ),
        onPressed: () {},
        label: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Schedule",
            style: ConstantText.textstyle12.copyWith(
              color: ConstantColor.kprimaryWhite,
            ),
          ),
        ),
        icon: const Icon(Icons.calendar_month_outlined),
      ),
    );
  }
}
