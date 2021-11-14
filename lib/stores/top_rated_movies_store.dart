import 'package:mobx/mobx.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/models/movie.dart';

part 'top_rated_movies_store.g.dart';

class TopRatedMoviesStore = _TopRatedMoviesStore with _$TopRatedMoviesStore;

abstract class _TopRatedMoviesStore with Store {
  final Repository _repository;
  int _currentPage = 0;
  bool _isOutOfMovies = false;

  _TopRatedMoviesStore(this._repository);

  @observable
  bool isInitialLoading = true;

  @observable
  bool isLoadingMore = false;

  @observable
  ObservableList<Movie> topRatedMovies = ObservableList();

  @action
  Future fetchInitData() async {
    await _fetchTopRatedMovies();
    isInitialLoading = false;
  }

  Future _fetchTopRatedMovies() async {
    final response = await _repository.fetchTopRatedMovies(page: _currentPage + 1);
    if (response?.results?.isNotEmpty ?? false) {
      _currentPage++;
      _isOutOfMovies = _currentPage >= (response?.totalPages ?? 0);
      topRatedMovies.addAll(response!.results!);
    }
  }

  @action
  Future loadMore() async {
    if (_isOutOfMovies || isLoadingMore) {
      return;
    }
    isLoadingMore = true;
    await _fetchTopRatedMovies();
    isLoadingMore = false;
  }
}
