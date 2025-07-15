part of 'doctors_cubit.dart';

enum SortOption { all, rating, favorite ,doctorInfo}

enum DoctorsAndSevices { doctors, services }

@immutable
sealed class DoctorsState {}

final class DoctorsInitial extends DoctorsState {}

class DoctorsSortByPageUpdate extends DoctorsState {
  final SortOption selectedOption;

  DoctorsSortByPageUpdate(this.selectedOption);
}

class DoctorsFavoreitPageUpdate extends DoctorsState {
  final DoctorsAndSevices selectedFavorietOption;

  DoctorsFavoreitPageUpdate(this.selectedFavorietOption);
}
