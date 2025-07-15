import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kMedicalFileUpload);
            },
            child: Image.asset(
              "assets/images/datamedis.png",
              width: 45.w,
              height: 39.h,
            ),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
              radius: 13.5.r,
              backgroundColor: ConstantColor.kprimaryLightBlue,
              child: const Icon(Icons.notifications_outlined)),
          SizedBox(width: 5.w),
          CircleAvatar(
              radius: 13.5.r,
              backgroundColor: ConstantColor.kprimaryLightBlue,
              child: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}
