import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class ProffesionalDoctor extends StatelessWidget {
  const ProffesionalDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/blueexperticon.svg",
        ),
        Text(
          "Professional Doctor",
          style: ConstantText.textstyle12.copyWith(
            color: ConstantColor.kprimaryBlue,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
