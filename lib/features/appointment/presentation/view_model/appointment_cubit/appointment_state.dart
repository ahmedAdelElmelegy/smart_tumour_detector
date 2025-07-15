part of 'appointment_cubit.dart';

enum AppointMentStateEnum { complete, upcoming, cancelled }

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentStateUpdate extends AppointmentState {
  
}

final class AppointmentRadioUpdate extends AppointmentState {}
