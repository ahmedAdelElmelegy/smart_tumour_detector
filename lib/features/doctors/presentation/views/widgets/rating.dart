import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/custom_info_icon_option.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/proffesional_doctor_rating.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(Dio())..getDoctors(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is DoctorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DoctorSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.doctors.length,
              itemBuilder: (context, index) => Container(
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
                      backgroundImage: MemoryImage(
                        base64Decode(state.doctors[index].profilePicture),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ProffesionalDoctorandRating(),
                        CustomDoctorNameContainer(
                          width: 211.w,
                          height: 43.h,
                          text: Text(
                            "${state.doctors[index].firstName} ${state.doctors[index].lastName}",
                            style: ConstantText.textstyle14.copyWith(
                              color: ConstantColor.kprimaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CustomInfoIconOption(
                          width: 74.w,
                          doctorModel: state.doctors[index],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else if (state is DoctorFailuer) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Icon(state.errMessage.errIcon)),
                Center(child: Text(state.errMessage.errMessage)),
              ],
            );
          } else {
            return const Center(child: Text('OOPS.... please try later'));
          }
        },
      ),
    );
  }
}
