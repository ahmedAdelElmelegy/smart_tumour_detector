import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final Widget? suff;
  final Widget? pre;
  final int? maxLength;
  final bool scure;
  final String? Function(String?)? valid;
  final Key? keys;
  final Color colors;
  final TextEditingController? controller;

  const CustomTextForm({
    super.key,
    required this.label,
    this.suff,
    this.pre,
    this.maxLength,
    required this.scure,
    this.valid,
    this.keys,
    this.controller,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: keys,
        child: TextFormField(
          cursorColor: ConstantColor.kprimaryBlue,
          controller: controller,
          validator: valid,
          maxLength: maxLength,
          obscureText: scure,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10.h),
            label: Text(label),
            suffixIcon: suff,
            prefixIcon: pre,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColor.kprimaryLightBlue),
              borderRadius: BorderRadius.circular(23.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColor.kprimaryLightBlue),
              borderRadius: BorderRadius.circular(23.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColor.kprimaryLightBlue),
              borderRadius: BorderRadius.circular(23.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColor.kprimaryLightBlue),
              borderRadius: BorderRadius.circular(23.r),
            ),
          ),
        ));
  }
}
