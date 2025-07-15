import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/local_notifcation_servieces/local_notifcation_services.dart';

class AvaliableTimes extends StatefulWidget {
  const AvaliableTimes({super.key});

  @override
  State<AvaliableTimes> createState() => _AvaliableTimesState();
}

class _AvaliableTimesState extends State<AvaliableTimes> {
  final List<String> times = [
    "9:00 AM",
    "9:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
  ];
  bool isSelected = false;
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: times.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          isSelected = selectedTime == times[index];
          return GestureDetector(
            onTap: () {
              selectedTime = times[index];

              setState(() {});

              LocalNotifcationServices.scheduelNotification(
                  times[index], context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? ConstantColor.kprimaryBlue
                    : ConstantColor.kprimaryLightBlue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                times[index],
                style: ConstantText.textstyle12.copyWith(
                  color: isSelected
                      ? ConstantColor.kprimaryWhite
                      : ConstantColor.kprimaryBlack,
                ),
              ),
            ),
          );
        });
  }
}
