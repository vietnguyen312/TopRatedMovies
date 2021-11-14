import 'package:topratedmovies/data/constants/endpoints.dart';
import 'package:topratedmovies/data/network/dio_client.dart';
import 'package:topratedmovies/models/top_rated_movies_response.dart';

class RemoteDatasource {
  final DioClient _dioClient;

  RemoteDatasource(this._dioClient);

  Future<TopRatedMovieResponse?> fetchTopRatedMovies({int page = 1}) async {
    final response = await _dioClient.get(Endpoints.getTopRatedMovies,
        queryParameters: {Endpoints.pageQueryParam: page, 'api_key': Endpoints.apiKey});
    return TopRatedMovieResponse.fromJson(response);
  }
}
