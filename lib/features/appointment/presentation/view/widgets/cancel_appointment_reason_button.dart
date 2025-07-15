import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class CancelAppointmentreasonButton extends StatelessWidget {
  const CancelAppointmentreasonButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: SizedBox(
        width: 270.w,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Appointment Canceled'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: ConstantColor.kprimaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          child: Text(
            "Cancel Appointment",
            style: ConstantText.textstyle24.copyWith(
              fontWeight: FontWeight.w400,
              color: ConstantColor.kprimaryWhite,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
