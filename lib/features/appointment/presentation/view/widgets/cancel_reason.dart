import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/cancel_appointment_enter_reason.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/cancel_appointment_radiolisttile.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/cancel_appointment_reason_button.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';

class CancelReason extends StatelessWidget {
  const CancelReason({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ConstantColor.kprimaryBlue,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: Text(
            "Cancel Appointment",
            style: ConstantText.textstyle24,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              const CancelAppointmentRadioListTile(),
              SizedBox(height: 15.h),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: ConstantText.textstyle14.copyWith(
                  color: ConstantColor.kprimaryCancelAppointmentDescrption,
                ),
              ),
              SizedBox(height: 15.h),
              AppointmentEnterReason(reasonController: reasonController,hintText: "Enter Your Reason Here...",),
              SizedBox(height: 71.h),
              const CancelAppointmentreasonButton(),
              SizedBox(height: 51.h),
            ],
          ),
        ),
      ),
    );
  }
}

