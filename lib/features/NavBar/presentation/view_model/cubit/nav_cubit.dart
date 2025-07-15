import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/appointment.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';

import 'package:smart_tumour_detector/features/home/presentation/views/home.dart';
import 'package:smart_tumour_detector/features/profile/presentation/views/profile_screen.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit(this.appointmentRepo) : super(NavInitial());

  int initialPage = 0;
  Widget? extraPage;
  Color color = ConstantColor.kprimaryWhite;
  final AppointmentRepo appointmentRepo;

  List<Widget> get pages => [
        const HomePage(),
        const ProfileScreen(),
        AppointmentPage(appointmentRepo: appointmentRepo),
      ];

  void selectPage(int index) {
    initialPage = index;
    extraPage = null;
    emit(NavSelcted());
  }

  void openExtraPage(Widget page) {
    extraPage = page;
    emit(NavSelcted());
  }

  void closeExtraPage(BuildContext context) {
    context.read<DoctorsCubit>().resetSortByOption();
    context.read<DoctorsCubit>().resetFavoriteOption();
    extraPage = null;
    emit(NavSelcted());
  }
}
