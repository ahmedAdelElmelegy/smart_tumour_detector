import 'package:dartz/dartz.dart';
import 'package:smart_tumour_detector/core/utils/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> forgetPassword(String email);
}
