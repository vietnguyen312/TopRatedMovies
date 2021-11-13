import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:topratedmovies/data/apis/remote_datasource.dart';
import 'package:topratedmovies/data/network/dio_client.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/di/module/network_module.dart';

final getIt = GetIt.instance;

Future setupLocator() async {
  getIt.registerLazySingleton<Dio>(() => NetworkModule.provideDio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<RemoteDatasource>(() => RemoteDatasource(getIt<DioClient>()));
  getIt.registerLazySingleton<Repository>(() => Repository(getIt<RemoteDatasource>()));
}
