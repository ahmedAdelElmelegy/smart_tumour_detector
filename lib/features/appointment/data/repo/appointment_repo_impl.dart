import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/appointment_page_body.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/canceld_appointment.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/upcoming_appointment.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  @override
  Widget appointmentStateFunc(AppointMentStateEnum appointmentState) {
    switch (appointmentState) {
      case AppointMentStateEnum.complete:
        return const AppointmentCompletePageBody();
      case AppointMentStateEnum.upcoming:
        return const UpcomingAppointment();
      case AppointMentStateEnum.cancelled:
        return const CanceldAppointment();
    }
  }
}
