import 'dart:io';

import 'package:dio/dio.dart';

class NetworkException implements Exception {
  String? message;
  int? statusCode;

  NetworkException({this.message, this.statusCode});
}

class NoInternetConnectionException implements Exception {}

class TimeoutException implements Exception {}

Exception transformToAppException(Exception error) {
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeoutException();
      case DioErrorType.response:
        return NetworkException(message: error.message, statusCode: error.response?.statusCode);
    }
  } else if (error is SocketException) {
    return NoInternetConnectionException();
  }
  return error;
}

