import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/pages/message.dart';
import 'package:twitter_clone/pages/search.dart';
import 'package:twitter_clone/icons.dart';

import 'home.dart';
import 'notifications.dart';

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
  int initialIndex = 0;
  int currentIndex = 0;
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
      initialIndex: initialIndex,
      length: 4,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_navbarHeaderCard, _divider, _navbarItemList, _divider],
          ),
        ),
        bottomNavigationBar: _bottomAppBar,
        body: SafeArea(
          child: Column(
            children: [
              _containerAppBar,
              Expanded(
                child: TabBarView(
                  children: [
                    Home(_scrollController),
                    Search(_scrollController),
                    Notifications(_scrollController),
                    const Message()
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
        shape:
            const Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        centerTitle: currentIndex == 2 ? false : true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.string(
              currentIndex == 1
                  ? AppIcons.setting
                  : currentIndex == 2
                      ? AppIcons.setting
                      : currentIndex == 3
                          ? AppIcons.setting
                          : AppIcons.storm,
              height: 25,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ],
        title: _appBarItems,
        elevation: 0,
      );
  Widget get _appBarItems => Wrap(
        spacing: 100,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          currentIndex == 1
              ? _searchField('Twitter\'da Ara')
              : currentIndex == 2
                  ? _notificationAppBar
                  : currentIndex == 3
                      ? _searchField('Direkt Mesajlarda Ara')
                      : _homeAppBar
        ],
      );

  Widget get _containerAppBar => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _tabBar => TabBar(
        physics: const NeverScrollableScrollPhysics(),
        onTap: ((index) {
          setState(() {
            currentIndex = index;
          });
        }),
        unselectedLabelColor: CupertinoColors.inactiveGray,
        tabs: [
          Tab(icon: _svgIcon(AppIcons.home)),
          Tab(icon: _svgIcon(AppIcons.search)),
          Tab(icon: _svgIcon(AppIcons.notifications)),
          Tab(icon: _svgIcon(AppIcons.message)),
        ],
      );
  Widget get _homeAppBar => SvgPicture.string(
        AppIcons.twitterLogo,
        height: 30,
      );
  Widget _searchField(String title) => SizedBox(
        height: 35,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            hintText: title,
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );

  Widget get _notificationAppBar => Text(
        'Bildirimler',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26),
      );

  Widget _svgIcon(String icon) => SvgPicture.string(
        icon,
        color: CupertinoColors.activeBlue,
        height: 20,
      );
  Widget get _navBarHeaderListTile => ListTile(
        trailing: const Icon(Icons.more_horiz_outlined),
        title: SizedBox(
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Alihan Gedik'),
                  const Text('@alihangedik'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: const [
                        Text('241 Takip Edilen'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('39 Takipçi'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _navbarHeaderCard => Card(
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _navBarHeaderListTile,
      );
  Widget _navbarItems(String title) => Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.list_alt_rounded,
              size: 30,
            ),
            title: Text(title),
          )
        ],
      );

  Widget get _navbarItemList => ListView(
        shrinkWrap: true,
        children: [
          _navbarItems('Profil'),
          _navbarItems('Konular'),
          _navbarItems('Yer İşaretleri'),
          _navbarItems('Listeler'),
          _navbarItems('Twitter Çevresi'),
        ],
      );

  Widget get _divider => Divider(
        endIndent: 40,
        indent: 20,
      );
  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
}