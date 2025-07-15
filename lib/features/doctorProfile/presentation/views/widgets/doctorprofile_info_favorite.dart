import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class DoctorProfileinfoandfavorite extends StatelessWidget {
  const DoctorProfileinfoandfavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ConstantColor.kprimaryLightBlue,
              radius: 11,
              child: Icon(
                Icons.question_mark,
                size: 15,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: ConstantColor.kprimaryLightBlue,
              radius: 11,
              child: Icon(
                Icons.favorite,
                size: 15,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
