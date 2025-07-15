import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/custom_button.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/change_password_fields.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.w, right: 25.w, top: 70.h, bottom: 25.h),
      child: Column(
        children: [
          const ChangePasswordFields(),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: CustomButton(
              onPressed: () {},
              title: 'Create New Password',
              width: 322.w,
            ),
          )
        ],
      ),
    );
  }
}
