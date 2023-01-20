import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/tabbar_view.dart';
import 'package:twitter_clone/theme/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter',
      home: const TwTabbarView(),
      theme: ThemeData.dark().copyWith(
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
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
