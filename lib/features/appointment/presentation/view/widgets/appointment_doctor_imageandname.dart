import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class DoctorImageAndName extends StatelessWidget {
  const DoctorImageAndName({
    super.key,
     this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 31.5,
          backgroundImage: MemoryImage(
            base64Decode(
              doctorModel?.profilePicture??'',
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${doctorModel?.firstName}${doctorModel?.lastName}",
              style: ConstantText.textstyle16,
            ),
            Text(
              "Dermato-Endocrinology",
              style: ConstantText.textstyle14,
            ),
          ],
        )
      ],
    );
  }
}
