import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  const Calender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 370.h,
      color: ConstantColor.kprimaryLightBlue,
      child: TableCalendar(
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: ConstantColor.kprimaryBlue,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ConstantColor.kprimaryBlue),
          ),
          todayTextStyle: TextStyle(color: ConstantColor.kprimaryBlue),
          weekendTextStyle: const TextStyle(color: Colors.black),
          defaultTextStyle: const TextStyle(color: Colors.black),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: const TextStyle(color: Colors.white),
            weekendStyle: const TextStyle(color: Colors.white),
            decoration: BoxDecoration(
              color: ConstantColor.kprimaryBlue,
            )),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        headerStyle: HeaderStyle(
            leftChevronIcon:
                Icon(Icons.arrow_back_ios, color: ConstantColor.kprimaryBlue),
            rightChevronIcon: Icon(Icons.arrow_forward_ios,
                color: ConstantColor.kprimaryBlue),
            titleCentered: true,
            titleTextStyle: ConstantText.textstyle16),
      ),
    );
  }
}
