import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/products/home_tabbar.dart';
import 'package:twitter_clone/products/spaces.dart';
import 'package:twitter_clone/products/tweet_list.dart';
import 'package:twitter_clone/theme/colors.dart';

import 'full_screen_image.dart';

class Home extends StatefulWidget {
  const Home(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SpacesMixin {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: tabBar,
          toolbarHeight: 0,
        ),
        body: TabBarView(children: [
          TweetList(
            widget.controller,
            isScrollable: true,
          ),
          TweetList(
            widget.controller,
            isScrollable: true,
          )
        ]),
      ),
    );
  }
}
