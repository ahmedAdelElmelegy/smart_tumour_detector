import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class UpcomingTimeDoctorAppointment extends StatelessWidget {
  const UpcomingTimeDoctorAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 112.w,
          height: 18.h,
          decoration: BoxDecoration(
              color: ConstantColor.kprimaryWhite,
              borderRadius: BorderRadius.circular(13.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: ConstantColor.kprimaryBlue,
                size: 15,
              ),
              Text(
                "Sunday, 12 June",
                style: ConstantText.textstyle12.copyWith(
                  color: ConstantColor.kprimaryBlue,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 129.w,
          height: 18.h,
          decoration: BoxDecoration(
              color: ConstantColor.kprimaryWhite,
              borderRadius: BorderRadius.circular(13.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/alarm.svg",
              ),
              const SizedBox(width: 5),
              Text(
                maxLines: 2,
                overflow: TextOverflow.fade,
                "9:30 AM - 10:00 AM",
                style: ConstantText.textstyle12.copyWith(
                  color: ConstantColor.kprimaryBlue,
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
