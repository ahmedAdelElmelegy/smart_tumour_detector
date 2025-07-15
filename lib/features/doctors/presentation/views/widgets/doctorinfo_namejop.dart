import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';

class DoctorInfoNameAndJop extends StatelessWidget {
  const DoctorInfoNameAndJop({super.key, this.doctorModel});
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return CustomDoctorNameContainer(
      height: 42,
      width: 260,
      text: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  '${doctorModel?.firstName ?? 'Doctor'} ${doctorModel?.lastName ?? "Name"}\n',
              style: ConstantText.textstyle15.copyWith(
                color: ConstantColor.kprimaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(text: 'Dermato-Genetics', style: ConstantText.textstyle13),
          ],
        ),
      ),
    );
  }
}
