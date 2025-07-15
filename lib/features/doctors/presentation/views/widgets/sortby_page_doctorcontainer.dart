import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/custom_info_icon_option.dart';

class SortByPageDoctorContainer extends StatelessWidget {
  const SortByPageDoctorContainer({
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
              itemCount: state.doctors.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: 300.w,
                height: 136.h,
                decoration: BoxDecoration(
                  color: ConstantColor.kprimaryLightBlue,
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      onBackgroundImageError: (exception, stackTrace) {
                        Image.asset('assets/images/Maskgroup2.png');
                      },
                      radius: 51,
                      backgroundImage: MemoryImage(
                        base64Decode(state.doctors[index].profilePicture),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${state.doctors[index].firstName} ${state.doctors[index].lastName}",
                          style: ConstantText.textstyle16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Dermato-Endocrinology",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ConstantText.textstyle14,
                        ),
                        const SizedBox(height: 14),
                        CustomInfoIconOption(
                          width: 10.w,
                          doctorModel: state.doctors[index],
                        ),
                        const SizedBox(height: 18),
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
