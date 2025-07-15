import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/Proffesional_doctor.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/blue_button_insortby.dart';

class FavoreitContainerContent extends StatelessWidget {
  const FavoreitContainerContent({
    super.key,
    this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17.h),
      width: 320.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: ConstantColor.kprimaryLightBlue,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 40.r,
            child: Image.memory(
              base64Decode(doctorModel!.profilePicture),
              fit: BoxFit.fill,
              width: 80.h,
              height: 80.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProffesionalDoctor(),
                const SizedBox(height: 5),
                CustomDoctorNameContainer(
                  width: 220.w,
                  height: 50.h,
                  text: Stack(
                    children: [
                      Text(
                        "${doctorModel!.firstName} ${doctorModel!.lastName}",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: ConstantText.textstyle14.copyWith(
                          color: ConstantColor.kprimaryBlue,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Positioned(
                        right: -10,
                        top: 10,
                        child: IconButton(
                          color: ConstantColor.kprimaryBlue,
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                BlueButtonInSortBy(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRoutes.kschudelandpatiendetails,
                      extra: doctorModel,
                    );
                  },
                  width: 211.w,
                  height: 20,
                  text: "Make Appointment",
                  style: ConstantText.textstyle12.copyWith(
                    color: ConstantColor.kprimaryWhite,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
