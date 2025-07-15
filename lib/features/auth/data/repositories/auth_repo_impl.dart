import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_tumour_detector/core/utils/api_service.dart';
import 'package:smart_tumour_detector/core/utils/failure.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> register({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiService.postJson(
        endpoint: '/api/account/register',
        body: data,
      );
      return right(response.data.toString());
    } catch (e) {
      if (e is Failure) {
        return left(e);
      } else if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(
            ServerFailure(message: 'Unexpected error, please try again'));
      }
    }
  }

  @override
  @override
Future<Either<Failure, String>> login({
  required String email,
  required String password,
}) async {
  try {
    final body = {
      'email': email,
      'password': password,
    };

    final response = await apiService.postJson(
      endpoint: '/api/account/login',
      body: body,
    );

    final responseData = response.data;

    if (responseData is Map<String, dynamic> &&
        responseData.containsKey('data') &&
        responseData['data'] is Map<String, dynamic> &&
        responseData['data'].containsKey('token')) {
      final token = responseData['data']['token'];
      return right(token.toString());
    } else {
      return left(ServerFailure(message: 'Invalid login response'));
    }
  } catch (e) {
    if (e is Failure) {
      return left(e);
    } else if (e is DioException) {
      return left(ServerFailure.fromDioException(e));
    } else {
      return left(ServerFailure(message: 'Unexpected error, please try again'));
    }
  }
}



  @override
 @override
Future<Either<Failure, String>> forgetPassword(String email) async {
  try {
    final response = await apiService.postJson(
      endpoint: 'http://tumordetector.runasp.net/api/account/forgetpassword?code=$email',
      body: '"$email"',
    );

    if (response.data is Map<String, dynamic>) {
      final message = response.data["message"] ?? "Success";
      return right(message.toString());
    } else {
      return right("Success");
    }

  } catch (e) {
    if (e is Failure) {
      return left(e);
    } else if (e is DioException) {
      return left(ServerFailure.fromDioException(e));
    } else {
      return left(ServerFailure(message: 'Unexpected error occurred'));
    }
  }
}

}
