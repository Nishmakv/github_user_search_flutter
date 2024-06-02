import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiManager {
  final Dio _dio = Dio();
  ApiManager() {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));
  }

  Future get(
    String path,
  ) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(error) {
    if (error is DioException) {
      return error.message;
    } else {
      return Text('Unexpected error occurs');
    }
  }
}
