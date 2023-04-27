import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeDark = ThemeData.light().copyWith(
  buttonTheme: const ButtonThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent),
  splashColor: AppColors.grey,
  highlightColor: AppColors.grey,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.darkGrey,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppColors.tweepinkLight, width: 0.5)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.darkGrey)),
  ),
  dividerColor: AppColors.tweepink.withOpacity(0.4),
  iconTheme: IconThemeData(color: AppColors.tweepink),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.tweepink),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.tweepink.withOpacity(1),
  ),
);
