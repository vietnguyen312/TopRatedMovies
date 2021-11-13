import 'package:dio/dio.dart';
import 'package:topratedmovies/data/constants/endpoints.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio()
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};
    return dio;
  }
}
