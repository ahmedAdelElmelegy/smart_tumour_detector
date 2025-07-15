import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/doctor_container_content.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
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
                itemBuilder: (context, index) {
                  return DoctorContainercontent(
                    doctorModel: state.doctors[index],
                  );
                },
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
    );
  }
}
