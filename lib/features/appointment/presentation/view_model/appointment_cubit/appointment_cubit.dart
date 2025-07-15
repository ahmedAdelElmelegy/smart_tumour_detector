import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({this.appointmentRepo}) : super(AppointmentInitial());
  final AppointmentRepo? appointmentRepo;

  AppointMentStateEnum selectedState = AppointMentStateEnum.complete;
  int initSelected = 0;
bool radioisSelected = false;
String? groupValue;
  final List<String> appointmentState = ["Complete", "Upcoming", "Cancelled"];
  final List<String> reasons = [
      "Rescheduling",
      "Weather Conditions",
      "Unexpected Work",
      "Others",
    ];

  void selectedAppointmentOptionIndex(int index) {
    initSelected = index;

    switch (index) {
      case 0:
        selectedState = AppointMentStateEnum.complete;
        break;
      case 1:
        selectedState = AppointMentStateEnum.upcoming;
        break;
      case 2:
        selectedState = AppointMentStateEnum.cancelled;
        break;
    }
    emit(AppointmentStateUpdate());
  }

  void radioSelect(String? value){
    groupValue=value;
    emit(AppointmentRadioUpdate());
  }


}
