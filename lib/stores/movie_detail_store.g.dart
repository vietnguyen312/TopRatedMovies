// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailStore on _MovieDetailStore, Store {
  final _$movieAtom = Atom(name: '_MovieDetailStore.movie');

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$youtubeTrailerIdAtom =
      Atom(name: '_MovieDetailStore.youtubeTrailerId');

  @override
  String? get youtubeTrailerId {
    _$youtubeTrailerIdAtom.reportRead();
    return super.youtubeTrailerId;
  }

  @override
  set youtubeTrailerId(String? value) {
    _$youtubeTrailerIdAtom.reportWrite(value, super.youtubeTrailerId, () {
      super.youtubeTrailerId = value;
    });
  }

  final _$posterAtom = Atom(name: '_MovieDetailStore.poster');

  @override
  String? get poster {
    _$posterAtom.reportRead();
    return super.poster;
  }

  @override
  set poster(String? value) {
    _$posterAtom.reportWrite(value, super.poster, () {
      super.poster = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MovieDetailStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
movie: ${movie},
youtubeTrailerId: ${youtubeTrailerId},
poster: ${poster},
isLoading: ${isLoading}
    ''';
  }
}
