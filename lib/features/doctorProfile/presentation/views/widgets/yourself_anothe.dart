import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class YourSelfOrAnotherPerson extends StatefulWidget {
  const YourSelfOrAnotherPerson({
    super.key,
  });

  @override
  State<YourSelfOrAnotherPerson> createState() =>
      _YourSelfOrAnotherPersonState();
}

class _YourSelfOrAnotherPersonState extends State<YourSelfOrAnotherPerson> {
  bool yourselfSelected = false;
  bool anotherSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: yourselfSelected
                ? ConstantColor.kprimaryBlue
                : ConstantColor.kprimaryWhite,
          ),
          onPressed: () {
            setState(() {
              yourselfSelected = !yourselfSelected;
            });
            anotherSelected = false;
          },
          child: Text(
            'yourself',
            style: ConstantText.textstyle12.copyWith(
              color: yourselfSelected
                  ? ConstantColor.kprimaryWhite
                  : ConstantColor.kprimaryBlue,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: anotherSelected
                ? ConstantColor.kprimaryBlue
                : ConstantColor.kprimaryWhite,
          ),
          onPressed: () {
            setState(() {
              anotherSelected = !anotherSelected;
            });
            yourselfSelected = false;
          },
          child: Text(
            'another person',
            style: ConstantText.textstyle12.copyWith(
              color: anotherSelected
                  ? ConstantColor.kprimaryWhite
                  : ConstantColor.kprimaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
