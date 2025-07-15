import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/cubits/get_doctor_cubit.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/favorite_container_content.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/favorite_option.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/services.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key, required this.showAppBar});
final bool showAppBar;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(Dio())..getDoctors(),
      child: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          Widget content = favorietOption(
              context.read<DoctorsCubit>().selectedFavoretoption);
          return Scaffold(
            appBar:showAppBar? AppBar(
              leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ConstantColor.kprimaryBlue,
                ),
              ),
              title: Text(
                'Favorite',
                style: ConstantText.textstyle24,
              ),
              centerTitle: true,
            ):null,
            body: Column(
              children: [
                const FavorietOption(),
                Expanded(child: content),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget favorietOption(DoctorsAndSevices selectedFavoretoption) {
    switch (selectedFavoretoption) {
      case DoctorsAndSevices.doctors:
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is DoctorLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DoctorSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.doctors.length,
                itemBuilder: (context, index) => FavoreitContainerContent(
                  doctorModel: state.doctors[index],
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
        );

      case DoctorsAndSevices.services:
        return const Services();
      default:
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const FavoreitContainerContent(),
        );
    }
  }
}
