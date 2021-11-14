import 'package:topratedmovies/data/apis/remote_datasource.dart';
import 'package:topratedmovies/models/top_rated_movies_response.dart';

class Repository {
  final RemoteDatasource _remoteDatasource;

  Repository(this._remoteDatasource);

  Future<TopRatedMovieResponse?> fetchTopRatedMovies({int page = 1}) async {
    return _remoteDatasource.fetchTopRatedMovies(page: page);
  }
}
