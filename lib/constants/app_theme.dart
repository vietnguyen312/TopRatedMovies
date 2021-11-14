import 'package:flutter/material.dart';
import 'package:topratedmovies/constants/colors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.blue[500],
  primaryColorBrightness: Brightness.light,
  primaryColorDark: AppColors.blue[700],
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blue[500],
    titleTextStyle: const TextStyle(color: Colors.white),
  ),
);
