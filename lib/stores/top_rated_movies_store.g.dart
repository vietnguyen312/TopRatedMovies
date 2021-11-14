// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopRatedMoviesStore on _TopRatedMoviesStore, Store {
  final _$isInitialLoadingAtom =
      Atom(name: '_TopRatedMoviesStore.isInitialLoading');

  @override
  bool get isInitialLoading {
    _$isInitialLoadingAtom.reportRead();
    return super.isInitialLoading;
  }

  @override
  set isInitialLoading(bool value) {
    _$isInitialLoadingAtom.reportWrite(value, super.isInitialLoading, () {
      super.isInitialLoading = value;
    });
  }

  final _$isLoadingMoreAtom = Atom(name: '_TopRatedMoviesStore.isLoadingMore');

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  final _$topRatedMoviesAtom =
      Atom(name: '_TopRatedMoviesStore.topRatedMovies');

  @override
  ObservableList<Movie> get filteredTopRatedMovies {
    _$topRatedMoviesAtom.reportRead();
    return super.filteredTopRatedMovies;
  }

  @override
  set filteredTopRatedMovies(ObservableList<Movie> value) {
    _$topRatedMoviesAtom.reportWrite(value, super.filteredTopRatedMovies, () {
      super.filteredTopRatedMovies = value;
    });
  }

  final _$fetchInitDataAsyncAction =
      AsyncAction('_TopRatedMoviesStore.fetchInitData');

  @override
  Future<dynamic> fetchInitData() {
    return _$fetchInitDataAsyncAction.run(() => super.fetchInitData());
  }

  final _$loadMoreAsyncAction = AsyncAction('_TopRatedMoviesStore.loadMore');

  @override
  Future<dynamic> loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  final _$_TopRatedMoviesStoreActionController =
      ActionController(name: '_TopRatedMoviesStore');

  @override
  void filterReleasedDateChanged(int? fromYear, int? toYear) {
    final _$actionInfo = _$_TopRatedMoviesStoreActionController.startAction(
        name: '_TopRatedMoviesStore.filterReleasedDateChanged');
    try {
      return super.filterReleasedDateChanged(fromYear, toYear);
    } finally {
      _$_TopRatedMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitialLoading: ${isInitialLoading},
isLoadingMore: ${isLoadingMore},
topRatedMovies: ${filteredTopRatedMovies}
    ''';
  }
}
