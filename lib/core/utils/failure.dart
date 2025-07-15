import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioException(DioException e) {
    try {
      final data = e.response?.data;

      if (data is Map<String, dynamic>) {
        // 1. لو فيه "errors"
        if (data.containsKey("errors")) {
          final errors = data["errors"];
          if (errors is Map<String, dynamic>) {
            final firstKey = errors.keys.first;
            final firstValue = errors[firstKey];

            if (firstValue is List && firstValue.isNotEmpty) {
              return ServerFailure(message: firstValue.first.toString());
            }
          }
        }

        // 2. لو فيه "message"
        if (data.containsKey("message")) {
          final msg = data["message"];
          if (msg is String) {
            return ServerFailure(message: msg);
          }
        }
      }

      // fallback على status codes
      final statusCode = e.response?.statusCode;
      if (statusCode == 400) {
        return ServerFailure(message: "Bad Request");
      } else if (statusCode == 401) {
        return ServerFailure(message: "Unauthorized: Please log in");
      } else if (statusCode == 403) {
        return ServerFailure(message: "Forbidden: Access denied");
      } else if (statusCode == 404) {
        return ServerFailure(message: "Not found");
      } else if (statusCode == 422) {
        return ServerFailure(message: "Validation error");
      } else if (statusCode == 500) {
        return ServerFailure(message: "Internal server error");
      } else {
        return ServerFailure(message: "Oops! Unexpected error occurred.");
      }
    } catch (e) {
      return ServerFailure(message: "Error parsing server response");
    }
  }
}
