import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class HorizontialCalender extends StatefulWidget {
  const HorizontialCalender({
    super.key,
  });

  @override
  State<HorizontialCalender> createState() => _HorizontialCalenderState();
}

class _HorizontialCalenderState extends State<HorizontialCalender> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return HorizontalWeekCalendar(
        scrollPhysics: const BouncingScrollPhysics(),
        monthColor: ConstantColor.kprimaryBlue,
        showNavigationButtons: false,
        borderRadius: BorderRadius.circular(25.r),
        activeTextColor: ConstantColor.kprimaryWhite,
        inactiveTextColor: ConstantColor.kprimaryLightBlue,
        activeBackgroundColor: ConstantColor.kprimaryBlue,
        activeNavigatorColor: ConstantColor.kprimaryBlue,
        inactiveBackgroundColor: ConstantColor.kprimaryWhite,
        minDate: selectedDate.subtract(const Duration(days: 14)),
        maxDate: selectedDate.add(const Duration(days: 60)),
        initialDate: selectedDate,
        onDateChange: (date) {
          setState(() {
            selectedDate = date;
          });
        });
  }
}
