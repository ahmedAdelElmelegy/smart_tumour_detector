import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/favoritandinfo.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/star_and_comment.dart';

class DoctorContainercontent extends StatelessWidget {
  const DoctorContainercontent({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(doctorModel.profilePicture);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      width: 300.w,
      height: 74.h,
      decoration: BoxDecoration(
          color: ConstantColor.kprimaryLightBlue,
          borderRadius: BorderRadius.circular(17.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bytes.isEmpty
              ? Image.asset('assets/images/Maskgroup2.png')
              : Image.memory(
                  bytes,
                  fit: BoxFit.fill,
                  width: 70.w,
                  height: 70.h,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 70);
                  },
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDoctorNameContainer(
                  width: 211.w,
                  height: 39.h,
                  text: Text(
                    '${doctorModel.firstName} ${doctorModel.lastName}',
                    style: ConstantText.textstyle14.copyWith(
                      color: ConstantColor.kprimaryBlue,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StarAndComment(),
                  SizedBox(width: 75.w),
                  FavoreiteAndInfo(
                    doctorModel: doctorModel,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
