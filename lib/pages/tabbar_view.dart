import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/pages/message.dart';
import 'package:twitter_clone/pages/search.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/theme/colors.dart';

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
        drawer: _drawer,
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
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _tabBar,
      );

  // Widget get _fabButton => FloatingActionButton(
  //       onPressed: (() {}),
  //       child: const Icon(Icons.add_rounded),
  //     );

  Widget get _appBar => AppBar(
        // shape: Border(
        //     bottom: BorderSide(
        //         color: AppColors.white.withOpacity(0.4), width: 0.5)),
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
            child: currentIndex == 0
                ? const SizedBox()
                : SvgPicture.string(AppIcons.setting,
                    height: 20, color: AppColors.white),
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
        indicatorColor: Colors.transparent,
        physics: const NeverScrollableScrollPhysics(),
        onTap: ((index) {
          setState(() {
            currentIndex = index;
          });
        }),
        unselectedLabelColor: CupertinoColors.inactiveGray,
        tabs: [
          Tab(
              icon: _svgIcon(
                  currentIndex == 0 ? AppIcons.homeBold : AppIcons.home)),
          Tab(
              icon: _svgIcon(
                  currentIndex == 1 ? AppIcons.searchBold : AppIcons.search)),
          Tab(
              icon: _svgIcon(currentIndex == 2
                  ? AppIcons.notificationsBold
                  : AppIcons.notifications)),
          Tab(
              icon: _svgIcon(
                  currentIndex == 3 ? AppIcons.messageBold : AppIcons.message)),
        ],
      );
  Widget get _homeAppBar => SvgPicture.string(
        AppIcons.twitterLogo,
        height: 25,
      );
  Widget _searchField(String title) => SizedBox(
        height: 30,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.only(left: 15),
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.string(
                AppIcons.search,
                color: AppColors.grey,
              ),
            ),
            fillColor: AppColors.darkGrey,
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent, width: 0, style: BorderStyle.none),
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
        color: AppColors.white,
        height: 24,
      );
  Widget get _navBarHeaderListTile => ListTile(
        trailing: const Icon(Icons.add_circle_outline),
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
  Widget _navbarItems(String title, String icon) => Column(
        children: [
          ListTile(
            leading: SvgPicture.string(icon),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      );

  Widget get _navbarItemList => ListView(
        shrinkWrap: true,
        children: [
          _navbarItems('Profil', AppIcons.profile),
          _navbarItems('Konular', AppIcons.subjects),
          _navbarItems('Yer İşaretleri', AppIcons.placeMarks),
          _navbarItems('Listeler', AppIcons.lists),
          _navbarItems('Twitter Çevresi', AppIcons.twitterCircle),
        ],
      );

  Widget get _drawer => Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_navbarHeaderCard, _divider, _navbarItemList, _divider],
        ),
      );

  Widget get _divider => const Divider(
        endIndent: 40,
        indent: 20,
      );
  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
}
