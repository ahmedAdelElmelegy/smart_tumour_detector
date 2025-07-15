import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/appointment_state_option.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key, required this.appointmentRepo});
  final AppointmentRepo appointmentRepo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(appointmentRepo: appointmentRepo),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColor.kprimaryWhite,
          title: Text(
            "All appointment",
            style: ConstantText.textstyle24,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (context, state) {
              return ListView(
                children: [
                  const AppointMentStateOption(),
                  appointmentRepo.appointmentStateFunc(
                    context.read<AppointmentCubit>().selectedState,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
