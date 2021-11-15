import 'package:mobx/mobx.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/models/movie.dart';

part 'top_rated_movies_store.g.dart';

class TopRatedMoviesStore = _TopRatedMoviesStore with _$TopRatedMoviesStore;

abstract class _TopRatedMoviesStore with Store {
  final Repository _repository;
  int _currentPage = 0;
  bool _isOutOfMovies = false;
  int? _fromReleasedYearFilter;
  int? _toReleasedYearFilter;
  final List<Movie> _topRatedMovies = [];

  _TopRatedMoviesStore(this._repository);

  @observable
  String? networkCallError = '';

  @observable
  bool isInitialLoading = true;

  @observable
  bool isLoadingMore = false;

  @observable
  ObservableList<Movie> filteredTopRatedMovies = ObservableList();

  int? get fromReleasedYearFilter => _fromReleasedYearFilter;

  int? get toReleasedYearFilter => _toReleasedYearFilter;

  @action
  Future fetchInitData() async {
    await _fetchTopRatedMovies();
    isInitialLoading = false;
  }

  Future _fetchTopRatedMovies() async {
    try {
      networkCallError = null;
      final response = await _repository.fetchTopRatedMovies(page: _currentPage + 1);
      if (response?.results?.isNotEmpty ?? false) {
        _currentPage++;
        _isOutOfMovies = _currentPage >= (response?.totalPages ?? 0);
        _topRatedMovies.addAll(response!.results!);
        filteredTopRatedMovies.addAll(_filterReleasedDateMovies(response.results!));
      }
    } on Exception catch (_) {
      // TODO: Should specify message detail
      networkCallError = 'Something went wrong';
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

  @action
  void filterReleasedDateChanged(int? fromYear, int? toYear) {
    _fromReleasedYearFilter = fromYear;
    _toReleasedYearFilter = toYear;
    filteredTopRatedMovies.clear();
    filteredTopRatedMovies.addAll(_filterReleasedDateMovies(_topRatedMovies));
  }

  List<Movie> _filterReleasedDateMovies(List<Movie> movies) {
    return movies.where((element) {
      bool isReleasedInRange = true;
      if (_fromReleasedYearFilter != null && element.releaseDate != null) {
        isReleasedInRange = element.releaseDate!.year >= _fromReleasedYearFilter!;
        if (!isReleasedInRange) {
          return false;
        }
      }
      if (_toReleasedYearFilter != null && element.releaseDate != null) {
        isReleasedInRange = element.releaseDate!.year <= _toReleasedYearFilter!;
      }
      return isReleasedInRange;
    }).toList();
  }
}
