import 'package:flutter/material.dart';
import 'package:topratedmovies/constants/colors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  primaryColorBrightness: Brightness.light,
  primaryColorDark: AppColors.blue[700],
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blue[500],
    titleTextStyle: const TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    labelStyle: TextStyle(color: AppColors.blue[700]),
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.solid, color: AppColors.blue[700]!),
    ),
  ),
);
