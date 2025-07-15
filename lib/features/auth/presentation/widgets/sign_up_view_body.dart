import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/have_account_row.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/sign_up_inputes_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 25.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpInputesSection(),
              SizedBox(
                height: 20.h,
              ),
              const HaveAccountRow(),
            ],
          ),
        ));
  }
}
              // The row with the option to go back to the login view
