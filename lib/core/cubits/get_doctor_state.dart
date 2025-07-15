part of 'get_doctor_cubit.dart';

sealed class HomeState {}

final class DoctorInitial extends HomeState {}

final class DoctorLoading extends HomeState {}

final class DoctorSuccess extends HomeState {
  final List<DoctorModel> doctors;

  DoctorSuccess({required this.doctors});
}

final class DoctorFailuer extends HomeState {
  final ServerFailure errMessage;

  DoctorFailuer({required this.errMessage});
}
