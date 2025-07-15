import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class BigFavoreiteAndInfo extends StatelessWidget {
  const BigFavoreiteAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push('/kprofilepage');
            },
            child: CircleAvatar(
              backgroundColor: ConstantColor.kprimaryWhite,
              radius: 12,
              child: Icon(
                Icons.question_mark,
                size: 20,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            backgroundColor: ConstantColor.kprimaryWhite,
            radius: 12,
            child: Icon(
              Icons.favorite,
              size: 20,
              color: ConstantColor.kprimaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
