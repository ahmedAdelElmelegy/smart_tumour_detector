import 'package:dartz/dartz.dart';
import 'package:smart_tumour_detector/core/api_error/api_error_handeler.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';

abstract class RepoDeclaration {
  Future<Either<ServerFailure,List<DoctorModel>>> getDoctors();
}