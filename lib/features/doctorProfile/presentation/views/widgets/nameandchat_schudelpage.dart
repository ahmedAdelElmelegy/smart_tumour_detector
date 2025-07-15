import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class PatienDetailsDoctorNameAndChat extends StatelessWidget {
  const PatienDetailsDoctorNameAndChat({
    super.key, required this.doctorModel,
  });
final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: ConstantColor.kprimaryBlue,
          ),
        ),
        Container(
          width: 156.w,
          height: 21.h,
          decoration: BoxDecoration(
            color: ConstantColor.kprimaryBlue,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Text(
            'Dr:${doctorModel.firstName} ${doctorModel.lastName}',
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: ConstantText.textstyle14.copyWith(
              fontWeight: FontWeight.w500,
              color: ConstantColor.kprimaryWhite,
            ),
          ),
        ),
        SizedBox(width: 3.w),
        // CircleAvatar(
        //   radius: 12.r,
        //   backgroundColor: ConstantColor.kprimaryBlue,
        //   child: Icon(
        //     size: 15,
        //     FontAwesomeIcons.comments,
        //     color: ConstantColor.kprimaryWhite,
        //   ),
        // )
      ],
    );
  }
}
