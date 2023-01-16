import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';

import 'home.dart';

class TwTabbarView extends StatefulWidget {
  const TwTabbarView({super.key});

  @override
  State<TwTabbarView> createState() => _TwTabbarViewState();
}

class _TwTabbarViewState extends State<TwTabbarView> {
  String avatarUrl =
      'https://avatars.githubusercontent.com/u/71148065?s=400&u=cd2b1a170fa19d2b44518a53d745ef860427ce25&v=4';
  bool isHeaderClose = false;
  double lastOffset = 0;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = _scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = _scrollController.offset;
      });
      // print(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: SafeArea(
          child: Column(
            children: [
              _containerAppBar,
              Expanded(
                child: TabBarView(
                  children: [
                    Home(_scrollController),
                    const Text('data'),
                    const Text('data'),
                    const Text('data'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _bottomAppBar => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: _tabBar,
      );

  // Widget get _fabButton => FloatingActionButton(
  //       onPressed: (() {}),
  //       child: const Icon(Icons.add_rounded),
  //     );

  Widget get _appBar => AppBar(
        title: _appBarItems('Home'),
        elevation: 0,
      );
  Widget _appBarItems(String icon) => Wrap(
        spacing: 130,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SvgPicture.string(
            AppIcons.twitterLogo,
            height: 30,
          ),
          SvgPicture.string(
            AppIcons.storm,
            color: CupertinoColors.activeBlue,
            height: 20,
          )
        ],
      );

  Widget get _containerAppBar => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _tabBar => TabBar(
        unselectedLabelColor: CupertinoColors.inactiveGray,
        tabs: [
          Tab(icon: _svgIcon(AppIcons.home)),
          Tab(icon: _svgIcon(AppIcons.search)),
          Tab(icon: _svgIcon(AppIcons.notifications)),
          Tab(icon: _svgIcon(AppIcons.message)),
        ],
      );

  Widget _svgIcon(String icon) => SvgPicture.string(
        icon,
        color: CupertinoColors.activeBlue,
        height: 20,
      );

  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
}
