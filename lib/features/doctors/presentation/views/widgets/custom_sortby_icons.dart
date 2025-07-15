import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class CustomSortByIcons extends StatelessWidget {
  const CustomSortByIcons(
      {super.key, this.onPressed, required this.icon, this.backgroundColor});

  final void Function()? onPressed;
  final Widget icon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 11.r,
      backgroundColor: backgroundColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        color: ConstantColor.kprimaryBlue,
        iconSize: 16,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
