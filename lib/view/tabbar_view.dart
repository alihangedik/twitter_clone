import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/pages/bookmarks.dart';
import 'package:twitter_clone/pages/message.dart';
import 'package:twitter_clone/pages/notifications_setting.dart';
import 'package:twitter_clone/pages/profile.dart';
import 'package:twitter_clone/pages/search.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/pages/search_setting.dart';
import 'package:twitter_clone/pages/subjects.dart';
import 'package:twitter_clone/theme/colors.dart';

import '../pages/home.dart';
import '../pages/notifications.dart';

class TwTabbarView extends StatefulWidget {
  const TwTabbarView({super.key});

  @override
  State<TwTabbarView> createState() => _TwTabbarViewState();
}

String avatarUrl =
    'https://avatars.githubusercontent.com/u/71148065?s=400&u=cd2b1a170fa19d2b44518a53d745ef860427ce25&v=4';
Widget get followerRow => Row(
      children: [
        Text(
          '243 Takip Edilen',
          style: TextStyle(color: AppColors.white),
        ),
        SizedBox(
          width: 20,
        ),
        Text('40 Takipçi', style: TextStyle(color: AppColors.white)),
      ],
    );

class _TwTabbarViewState extends State<TwTabbarView> {
  appbarPosition() {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // _showSheet() => showModalBottomSheet(
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(30), topRight: Radius.circular(30))),
  //       anchorPoint: Offset.fromDirection(2),
  //       builder: (context) {
  //         return Expanded(
  //           child: SizedBox(
  //             height: 300,
  //             child: Column(
  //               children: [
  //                 _sheetTopContainer,
  //                 _sheetIcon,
  //                 _sheetText('Zaman akışın Anasayfa olarak ayarlandı'),
  //                 _sheetListTile('En son Tweetlere geç', AppIcons.swap,
  //                     'Gönderilen en son Tweetler görünür.', true),
  //                 _sheetListTile('', AppIcons.setting,
  //                     'İçerik tercihlerini görüntüle', false)
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //       context: context,
  //     );

  bool isHeaderClose = false;
  double lastOffset = 0;
  late ScrollController _scrollController;
  int initialIndex = 0;
  int currentIndex = 0;
  bool isTap = false;

  fabOnpressed() {
    setState(() {
      isTap = !isTap;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    appbarPosition();
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
        floatingActionButton: fabButton(
            currentIndex == 3
                ? AppIcons.messageAdd
                : isTap == false
                    ? AppIcons.tweetAdd
                    : AppIcons.fabTweet,
            fabOnpressed),
        key: _scaffoldKey,
        drawer: _drawer,
        bottomNavigationBar: _bottomAppBar,
        body: SafeArea(
          child: Column(
            children: [
              _containerAppBar,
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Home(_scrollController),
                    Search(_scrollController),
                    Notifications(_scrollController),
                    Message(_scrollController)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fabButton(String icon, var onPressed) => SpeedDial(
        children: [
          _fabButtonItems('Gif', Icons.gif),
          _fabButtonItems('Fotoğraflar', Icons.image_outlined),
          _fabButtonItems('Sohbet Odaları', Icons.mic_rounded),
        ],
        child: SvgPicture.string(
          currentIndex == 3 ? AppIcons.messageAdd : AppIcons.fabTweet,
          color: AppColors.white,
        ),
      );

  //  FloatingActionButton(
  //       onPressed: fabOnpressed,
  //       child: SvgPicture.string(
  //         icon,
  //         color: Colors.white,
  //       ),
  //     );

  SpeedDialChild _fabButtonItems(String label, IconData icon) => SpeedDialChild(
      backgroundColor: AppColors.white,
      labelShadow: [const BoxShadow(color: Colors.transparent)],
      labelBackgroundColor: Colors.transparent,
      child: Icon(
        icon,
        size: 30,
        color: AppColors.tweepink,
      ),
      label: label);

  Widget get _bottomAppBar => BottomAppBar(
        color: AppColors.tweepink,
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
          child: InkWell(
            onTap: (() {
              setState(() {
                _scaffoldKey.currentState?.openDrawer();
              });
            }),
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
        ),
        centerTitle: currentIndex == 2 ? false : true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: currentIndex == 0
                ? const SizedBox()
                : IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => currentIndex == 1
                              ? const SearchSetting()
                              : currentIndex == 2
                                  ? const NotificationsSetting()
                                  : const SizedBox()),
                        ),
                      );
                    },
                    icon: SvgPicture.string(AppIcons.setting,
                        height: 20, color: AppColors.white),
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
        color: AppColors.tweepinkLight,
        height: 25,
      );
  Widget _searchField(String title) => SizedBox(
        height: 30,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            contentPadding: const EdgeInsets.only(left: 15),
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.tweepinkLight,
                ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.string(
                AppIcons.search,
                color: AppColors.tweepinkLight,
              ),
            ),
          ),
        ),
      );

  Widget get _notificationAppBar => Text(
        'Bildirimler',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 26, color: AppColors.white),
      );

  Widget _svgIcon(String icon) => SvgPicture.string(
        icon,
        color: AppColors.white,
        height: 24,
      );
  Widget get _navBarHeaderListTile => ListTile(
        tileColor: AppColors.tweepinkLight,
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
                  const Text(
                    'Alihan Gedik',
                    style: TextStyle(color: AppColors.white),
                  ),
                  const Text('@alihangedik',
                      style: TextStyle(color: AppColors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(child: followerRow)
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
  Widget _navbarItems(String title, String icon, route) => Column(
        children: [
          ListTile(
            onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => route),
                  ),
                )),
            leading: SvgPicture.string(
              icon,
              color: AppColors.white,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          )
        ],
      );

  Widget get _navbarItemList => ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _navbarItems('Profil', AppIcons.profile, Profile(_scrollController)),
          _navbarItems('Konular', AppIcons.subjects, const Subjects()),
          _navbarItems(
              'Yer İşaretleri', AppIcons.placeMarks, const BookMarks()),
          _navbarItems('Listeler', AppIcons.lists, const Subjects()),
          _navbarItems(
              'Twitter Çevresi', AppIcons.twitterCircle, const Subjects())
        ],
      );

  Widget get _drawer => Drawer(
        backgroundColor: AppColors.tweepinkLight,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _navbarHeaderCard,
              _divider,
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _navbarItemList,
                    _divider,
                    Column(
                      children: [
                        _expansionTile('Profesyoneller Araçlar'),
                        _expansionTile('Ayarlar ve Gizlilik'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget get _divider => const Divider(
        height: 40,
        endIndent: 40,
        indent: 20,
        color: AppColors.white,
      );

  // Widget get _sheetTopContainer => Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 10),
  //       child: Container(
  //         height: 6,
  //         width: 40,
  //         decoration: BoxDecoration(
  //             color: AppColors.grey, borderRadius: BorderRadius.circular(30)),
  //       ),
  //     );
  // Widget _sheetText(String sheetText) => Padding(
  //       padding: const EdgeInsets.all(14),
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           sheetText,
  //           style:
  //               Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
  //         ),
  //       ),
  //     );
  // Widget get _sheetIcon => Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 20),
  //       child: SvgPicture.string(
  //         AppIcons.feature,
  //         color: AppColors.white,
  //         height: 40,
  //       ),
  //     );

  // Widget _sheetListTile(
  //         String title, String icon, String subtitle, bool isHaveSubtitle) =>
  //     Column(
  //       children: [
  //         ListTile(
  //           minLeadingWidth: 10,
  //           subtitle: isHaveSubtitle == false
  //               ? null
  //               : Text(
  //                   title,
  //                   style: Theme.of(context).textTheme.caption,
  //                 ),
  //           leading: SvgPicture.string(
  //             icon,
  //             height: 25,
  //             color: AppColors.white,
  //           ),
  //           title: Text(subtitle),
  //         )
  //       ],
  //     );

  Widget _drawerListtile(String title, String icon) => ListTile(
        leading: SvgPicture.string(
          icon,
          color: AppColors.white,
          height: 22,
        ),
        title: Text(
          title,
          style: TextStyle(color: AppColors.white),
        ),
      );

  Widget _expansionTile(String title) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.white,
          collapsedIconColor: AppColors.white,
          title: Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  )),
          children: [
            _drawerListtile('Profesyoneller İçin Twitter', AppIcons.rocket),
            _drawerListtile('Gelire Dönüştürme', AppIcons.cash)
          ],
        ),
      );
  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.white);
}
