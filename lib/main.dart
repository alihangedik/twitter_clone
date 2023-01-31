import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/splash.dart';

import 'package:twitter_clone/view/tabbar_view.dart';
import 'package:twitter_clone/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twitter',
        home: TwTabbarView(),
        theme: themeDark);
  }
}
