import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class BlueButtonInSortBy extends StatelessWidget {
  const BlueButtonInSortBy({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.color,
    this.width = 47,
    this.height = 22,
    this.raduis = 13,
  });
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;
  final Color? color;
  final double? width;
  final double? height;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color == null
                ? ConstantColor.kprimaryBlue
                : color ?? ConstantColor.kprimaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis!.r),
            ),
            padding: EdgeInsets.zero),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
