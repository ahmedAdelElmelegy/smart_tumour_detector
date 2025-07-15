import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class AppointmentEnterReason extends StatelessWidget {
  const AppointmentEnterReason({
    super.key,
    required this.reasonController,
    required this.hintText,
  });

  final TextEditingController reasonController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 6,
      cursorColor: ConstantColor.kprimaryBlue,
      style: ConstantText.textstyle15.copyWith(
        fontWeight: FontWeight.w300,
        color: ConstantColor.kprimaryBlue,
      ),
      controller: reasonController,
      decoration: InputDecoration(
        filled: true,
        fillColor: ConstantColor.kprimaryCancelAppointmentTextField,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(
            color: ConstantColor.kprimaryLightBlue,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(
            color: ConstantColor.kprimaryLightBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(
            color: ConstantColor.kprimaryLightBlue,
          ),
        ),
        hintStyle: ConstantText.textstyle15.copyWith(
          fontWeight: FontWeight.w300,
          color: ConstantColor.kprimaryBlue,
        ),
      ),
    );
  }
}
