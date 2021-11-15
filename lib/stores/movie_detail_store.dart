import 'package:mobx/mobx.dart';
import 'package:topratedmovies/constants/constants.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/models/movie.dart';
import 'package:topratedmovies/models/movie_trailer.dart';

part 'movie_detail_store.g.dart';

class MovieDetailStore = _MovieDetailStore with _$MovieDetailStore;

abstract class _MovieDetailStore with Store {
  final Repository _repository;

  @observable
  Movie movie;

  @observable
  String? youtubeTrailerId;

  @observable
  String? poster;

  @observable
  bool isLoading = true;

  _MovieDetailStore(this.movie, this._repository) {
    fetchVideo();
  }

  Future fetchVideo() async {
    if (movie.id == null) {
      return;
    }
    try {
      final response = await _repository.fetchMovieTrailers(movie.id!);
      youtubeTrailerId = response?.results
          ?.firstWhere((element) => element.site == youtubeVideoResource, orElse: () => MovieTrailer()).key;
    } on Exception catch (_) {
      // TODO: Should show error message
    } finally {
      isLoading = false;
      if (youtubeTrailerId == null) {
        poster = movie.backdropPath;
      }
    }
  }
}
