import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';

class CancelAppointmentRadioListTile extends StatelessWidget {
  const CancelAppointmentRadioListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cubit.reasons.length,
          itemBuilder: (context, index) {
            cubit.radioisSelected =
                cubit.groupValue == cubit.reasons[index];
            return Container(
                decoration: BoxDecoration(
                  color: cubit.radioisSelected
                      ? ConstantColor.kprimaryLightBlue
                      : null,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: RadioListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      32.r,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  activeColor: ConstantColor.kprimaryBlue,
                  fillColor: WidgetStatePropertyAll(
                      ConstantColor.kprimaryBlue),
                  title: Text(
                      context.read<AppointmentCubit>().reasons[index],
                      style: ConstantText.textstyle16.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ConstantColor.kprimaryBlack,
                      )),
                  value: cubit.reasons[index],
                  groupValue: cubit.groupValue,
                  onChanged: (value) {
                    cubit.radioSelect(value);
                  },
                ));
          },
        );
      },
    );
  }
}
