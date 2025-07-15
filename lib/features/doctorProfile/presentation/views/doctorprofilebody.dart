import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/calender.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/chatandshcudel_icons.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_avelapletime.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_experence_container.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_namejop.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';

import 'widgets/doctorprofile_info_favorite.dart';

class DoctorProfileBody extends StatelessWidget {
  const DoctorProfileBody({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: BlocProvider(
            create: (context) => HomeCubit(Dio())..getDoctors(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is DoctorLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DoctorSuccess) {
                  return Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Schedule(),
                          DoctorProfileinfoandfavorite(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Container(
                          width: 310.w,
                          height: 290.h,
                          decoration: BoxDecoration(
                            color: ConstantColor.kprimaryLightBlue,
                            borderRadius: BorderRadius.circular(17.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    onBackgroundImageError:
                                        (exception, stackTrace) {
                                      Image.asset(
                                        fit: BoxFit.fill,
                                        'assets/images/Maskgroup2.png',
                                      );
                                    },
                                    radius: 70,
                                    backgroundImage: MemoryImage(
                                      base64Decode(
                                        doctorModel.profilePicture,
                                      ),
                                    ),
                                  ),
                                  const DcoctorInfoExperenceContainer(),
                                ],
                              ),
                              const SizedBox(height: 14),
                              DoctorInfoNameAndJop(
                                doctorModel: doctorModel,
                              ),
                              const SizedBox(height: 12),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: DoctorInfoAvelapileTime(),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 9, right: 295),
                        child: Text(
                          "Profile",
                          style: ConstantText.textstyle14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ConstantColor.kprimaryBlue,
                          ),
                        ),
                      ),
                      const Flexible(
                        child: Calender(),
                      )
                    ],
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
          ),
        ),
      ),
    );
  }
}
