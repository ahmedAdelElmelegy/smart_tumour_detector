import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class DoctorInfoExperienceContainerShape extends StatelessWidget {
  const DoctorInfoExperienceContainerShape({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
  });
  final double width;
  final double height;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: ConstantColor.kprimaryBlue,
          borderRadius: BorderRadius.circular(18)),
      child: widget,
    );
  }
}
