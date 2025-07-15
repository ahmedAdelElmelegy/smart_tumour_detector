import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/api_error/api_error_handeler.dart';
import 'package:smart_tumour_detector/core/utils/api_service.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/repo/get_doctorsrepo_declaration.dart';

class RepoImpl implements RepoDeclaration {
  final Dio dio;

  RepoImpl({required this.dio});
  @override
  Future<Either<ServerFailure, List<DoctorModel>>> getDoctors() async {
    ApiService apiService = ApiService.getDoctors(dio);
    try {
      final List response =
          await apiService.get(endpoint: 'api/admindashboard/getalldoctors');

      final doctorList = response.map(
        (e) {
          return DoctorModel.fromjson(e);
        },
      ).toList();
      return right(doctorList);
    } on DioException catch (e) {
      return left(ServerFailure.fromdioException(e));
    } catch (e) {
      log('$e===========================');
      return left(
        ServerFailure(
          errIcon: Icons.error,
          statusCode: 500,
          errMessage: 'Unexpected error occurred.',
        ),
      );
    }
  }
}
