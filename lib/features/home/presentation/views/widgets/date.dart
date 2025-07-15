import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDates = getWeekDates();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weekDates.map((date) {
        bool isToday = DateFormat('yyyy-MM-dd').format(date) ==
            DateFormat('yyyy-MM-dd').format(DateTime.now());

        return Container(
            width: 42.w,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height > 800 ? 70.h : 50.h,
              maxHeight: MediaQuery.of(context).size.height > 800 ? 70.h : 50.h,
            ),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: isToday
                    ? ConstantColor.kprimaryBlue
                    : ConstantColor.kprimaryWhite,
                borderRadius: BorderRadius.circular(18.r)),
            child: Column(
              children: [
                ConstantText.getTextWidget(
                  DateFormat('d').format(date),
                  FontWeight.w500,
                  24,
                  isToday
                      ? ConstantColor.kprimaryWhite
                      : ConstantColor.kprimaryBlack,
                ),
                ConstantText.getTextWidget(
                  DateFormat('EEE').format(date),
                  FontWeight.w300,
                  18,
                  isToday
                      ? ConstantColor.kprimaryWhite
                      : ConstantColor.kprimaryBlack,
                ),
              ],
            ));
      }).toList(),
    );
  }
}

List<DateTime> getWeekDates() {
  DateTime today = DateTime.now();
  int currentWeekday = today.weekday;
  DateTime startOfWeek = today.subtract(Duration(days: currentWeekday - 1));
  return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
}
