import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      home: const Home(),
      theme: ThemeData.light().copyWith(
        tabBarTheme: const TabBarTheme(
            labelColor: CupertinoColors.activeBlue,
            unselectedLabelColor: CupertinoColors.inactiveGray),
        appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
