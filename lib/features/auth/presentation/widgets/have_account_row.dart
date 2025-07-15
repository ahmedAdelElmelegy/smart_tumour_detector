import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
              color: const Color(0xff000000),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).go(AppRoutes.kLogin);
          },
          child: Text(
            ' Log In',
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
