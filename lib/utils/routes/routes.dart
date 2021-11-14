import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/di/components/service_locator.dart';
import 'package:topratedmovies/models/movie.dart';
import 'package:topratedmovies/stores/movie_detail_store.dart';
import 'package:topratedmovies/stores/top_rated_movies_store.dart';
import 'package:topratedmovies/ui/home/home.dart';
import 'package:topratedmovies/ui/movie_detail/movie_detail.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String movieDetail = '/movieDetail';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) {
          return Provider<TopRatedMoviesStore>(
            create: (_) => TopRatedMoviesStore(getIt<Repository>()),
            child: const HomeScreen(),
          );
        });
      case movieDetail:
        return MaterialPageRoute(builder: (_) {
          final movie = settings.arguments as Movie;
          return Provider<MovieDetailStore>(
            create: (_) => MovieDetailStore(movie, getIt<Repository>()),
            child: const MovieDetail(),
          );
        });
    }
  }
}
