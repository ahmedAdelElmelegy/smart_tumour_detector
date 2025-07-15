import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';

class AppointMentStateOption extends StatelessWidget {
  const AppointMentStateOption({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = context.watch<AppointmentCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 37),
      child: SizedBox(
        height: 27.h,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: appointmentCubit.appointmentState.length,
            itemBuilder: (context, index) {
              bool isSelected = appointmentCubit.initSelected == index;

              return GestureDetector(
                onTap: () {
                  appointmentCubit.selectedAppointmentOptionIndex(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 9.w),
                  width: 94.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ConstantColor.kprimaryBlue
                        : ConstantColor.kprimaryLightBlue,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Text(
                    appointmentCubit.appointmentState[index],
                    style: ConstantText.textstyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isSelected
                          ? ConstantColor.kprimaryWhite
                          : ConstantColor.kprimaryBlue,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
