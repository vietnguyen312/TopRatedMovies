
import 'package:dio/dio.dart';
import 'package:topratedmovies/data/constants/endpoints.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio()
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (option, handler) {
          option.queryParameters.addAll({Endpoints.apiKeyParam: Endpoints.apiKey});
          return handler.next(option);
        }),
      );
    return dio;
  }
}
