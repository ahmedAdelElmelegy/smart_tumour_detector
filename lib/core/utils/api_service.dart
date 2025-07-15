import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smart_tumour_detector/core/utils/failure.dart';

class ApiService {
  final String _baseUrl = 'http://tumordetector.runasp.net/';
  final Dio _dio;
  ApiService.getDoctors(this._dio);

  Future<List<dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');

    return response.data;
  }

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://tumordetector.runasp.net',
          receiveDataWhenStatusError: true,
        ));

  Future<Response> postForm({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
    required File profileImage,
  }) async {
    try {
      final formData = FormData.fromMap({
        ...queryParameters,
        'ProfileImage': await MultipartFile.fromFile(profileImage.path),
      });

      return await _dio.post(endpoint, data: formData);
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Response> postJson({
    required String endpoint,
    required dynamic body,
  }) async {
    try {
      return await _dio.post(endpoint, data: body);
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Response> login(Map<String, dynamic> data) async {
    return await postJson(endpoint: '/api/account/login', body: data);
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return await postJson(endpoint: '/api/account/register', body: data);
  }
}
