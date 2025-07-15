import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/sign_in_inputs_section.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
             EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 25.h),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         const  SignInInputsSection() ,
             SizedBox(
              height: 40.h,
            ),
           
          ]),
        ));
  }
}
