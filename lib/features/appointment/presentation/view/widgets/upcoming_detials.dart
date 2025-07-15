import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class UpcomingDetails extends StatelessWidget {
  const UpcomingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 174.w,
            height: 27.h,
            decoration: BoxDecoration(
              color: ConstantColor.kprimaryBlue,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Text(
              "Details",
              style: ConstantText.textstyle20,
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 14,
            backgroundColor: ConstantColor.kprimaryWhite,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 14,
            backgroundColor: ConstantColor.kprimaryWhite,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kCancelReason);
              },
              icon: Icon(
                Icons.close,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
