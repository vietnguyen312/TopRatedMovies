import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String movieDetail = '/movieDetail';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Container(),
    movieDetail: (BuildContext context) => Container(),
  };
}



