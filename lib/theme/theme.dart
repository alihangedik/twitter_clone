import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeDark = ThemeData.dark().copyWith(
  buttonTheme: ButtonThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent),
  splashColor: Colors.purple,
  highlightColor: Colors.purple,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.darkGrey,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.grey, width: 0.5)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.darkGrey)),
  ),
  dividerColor: AppColors.white.withOpacity(0.4),
  scaffoldBackgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.twitterBlue),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black.withOpacity(0.8),
  ),
);
