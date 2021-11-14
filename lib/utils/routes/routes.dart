import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topratedmovies/data/repository.dart';
import 'package:topratedmovies/di/components/service_locator.dart';
import 'package:topratedmovies/stores/top_rated_movies_store.dart';
import 'package:topratedmovies/ui/home/home.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String movieDetail = '/movieDetail';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Provider<TopRatedMoviesStore>(
          create: (_) => TopRatedMoviesStore(getIt<Repository>()),
          child: const HomeScreen(),
        ),
    movieDetail: (BuildContext context) => Container(),
  };
}
