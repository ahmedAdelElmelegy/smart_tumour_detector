import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/api_error/api_error_handeler.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/repo/get_doctors_repo_impl.dart';
part 'get_doctor_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio) : super(DoctorInitial());
  final Dio dio;
  Future getDoctors() async {
    RepoImpl repoImpl = RepoImpl(dio: dio);
    emit(DoctorLoading());
    final response = await repoImpl.getDoctors();
    response.fold((failuer) {
      emit(
        DoctorFailuer(errMessage: failuer),
      );
    }, (doctors) {
      emit(
        DoctorSuccess(doctors: doctors),
      );
    });
  }
}
