import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/upcoming_appointment_body.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.doctors.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: UpcomingAppointmentBody(
                  doctorModel: state.doctors[index],
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
