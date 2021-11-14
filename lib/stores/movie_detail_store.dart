import 'package:mobx/mobx.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/models/movie.dart';

part 'movie_detail_store.g.dart';

class MovieDetailStore = _MovieDetailStore with _$MovieDetailStore;

abstract class _MovieDetailStore with Store {
  final Repository _repository;
  final Movie _movie;

  _MovieDetailStore(this._movie, this._repository);
}
