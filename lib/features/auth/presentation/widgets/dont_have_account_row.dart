// import 'package:clone_app/widgets/customTextField.dart';
// import 'package:clone_app/widgets/customTextfield_bsecureText.dart';
// import 'package:clone_app/widgets/custom_button.dart';
// import 'package:clone_app/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Don't have an account? ",
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kSignUp);
          },
          child:  Text(
            "Sign Up ",
            style: TextStyle(
                color: const Color(0xff2260FF),
                fontSize: 17.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
