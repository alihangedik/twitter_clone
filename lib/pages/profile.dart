import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/pages/notifications.dart';
import 'package:twitter_clone/products/home_tabbar.dart';
import 'package:twitter_clone/products/profile_tabbar.dart';
import 'package:twitter_clone/products/tweet_list.dart';
import 'package:twitter_clone/view/tabbar_view.dart';
// import 'package:flutter/src/rendering/box.dart';

import '../theme/colors.dart';

class Profile extends StatefulWidget {
  const Profile(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ScrollController scrollController;
  bool isAppbarClose = false;
  double lastOffset = 0.0;
  String randomImage = "https://picsum.photos/200/300";
  showContextMenu() {
    showMenu(
        color: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        position: RelativeRect.fromDirectional(
            textDirection: TextDirection.rtl,
            start: 0,
            top: 0,
            end: 90,
            bottom: 0),
        items: [
          const PopupMenuItem(child: Text('Paylaş')),
          const PopupMenuItem(child: Text('Taslaklar')),
          const PopupMenuItem(child: Text('Bulunduğun Listeler')),
        ]);
  }

  appbarPosition() {
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        isAppbarClose = false;
      } else if (scrollController.offset >=
          scrollController.position.minScrollExtent) {
        isAppbarClose = true;
      } else {
        isAppbarClose = scrollController.offset > lastOffset ? true : false;
      }
      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    appbarPosition();
  }

  final themeBioText = const TextStyle(
    fontSize: 14,
    color: AppColors.grey,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
              bottom: profileTabBar,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 35,
                ),
              ),
              actions: [
                Wrap(
                  spacing: 10,
                  runAlignment: WrapAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      size: 35,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.more_horiz_rounded, size: 35),
                      onPressed: () => showContextMenu(),
                    ),
                  ],
                )
              ],
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 425,

              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                bool isCloseAppbar = constraints.maxHeight >
                    kToolbarHeight + MediaQuery.of(context).padding.top;
                return FlexibleSpaceBar(
                  stretchModes: [StretchMode.blurBackground],
                  collapseMode: CollapseMode.pin,
                  centerTitle: false,
                  title: isCloseAppbar == true
                      ? Stack(
                          children: [
                            Positioned(
                              top: 10,
                              child: Wrap(
                                  direction: Axis.vertical,
                                  runAlignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    const Text('Alihan Gedik'),
                                    Text(
                                      '613 Tweet',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: AppColors.white
                                                  .withOpacity(
                                                      isCloseAppbar == true
                                                          ? 1
                                                          : 0)),
                                    ),
                                  ]),
                            ),
                          ],
                        )
                      : SizedBox(),
                  background: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: Image.network(
                              randomImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: -45,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: AppColors.black,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: -40,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              child: CircleAvatar(
                                radius: isCloseAppbar == true ? 40 : 20,
                                backgroundImage: NetworkImage(avatarUrl),
                              ),
                            ),
                          ),
                        ],
                      ),
                      buildProfileHeader()
                    ],
                  ),
                );
              }),
              automaticallyImplyLeading: false,
              // bottom: const TabBar(
              //   tabs: [
              //     Text('sadsd'),
              //     Text('data'),
              //   ],
              // ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 100,
                  child: TabBarView(children: [
                    TweetList(widget.controller, isScrollable: false),
                    TweetList(widget.controller, isScrollable: false),
                    TweetList(widget.controller, isScrollable: false),
                    TweetList(widget.controller, isScrollable: false)
                  ]),
                );
              },
            ))
          ],
        )),
      ),
    );
  }

  Column buildProfileHeader() {
    return Column(
      children: [
        editProfileButton('Profili Düzenle'),
        userInfo,
      ],
    );
  }

  // Widget get appbar => AnimatedContainer(
  //       decoration: BoxDecoration(
  //           color: Colors.black.withOpacity(isAppbarClose == true ? 1 : 0)),
  //       height: 50,
  //       duration: const Duration(milliseconds: 400),
  //       child: AppBar(
  //         automaticallyImplyLeading: false,
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         toolbarHeight: isAppbarClose == true ? 50 : 0,
  //         title: buildAppbarInfo(),
  //       ),
  //     );

  // Padding buildAppbarInfo() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 40),
  //     child: Wrap(direction: Axis.vertical, children: [
  //       const Text('Alihan Gedik'),
  //       Text(
  //         '618 Tweet',
  //         style: Theme.of(context).textTheme.bodyMedium,
  //       ),
  //     ]),
  //   );
  // }

  // Widget get containerAppbar => AnimatedContainer(
  //       width: MediaQuery.of(context).size.width,
  //       height: 130,
  //       duration: const Duration(milliseconds: 1000),
  //       child: appbar,
  //     );
  // Widget get headerImage => SizedBox(
  //       child: Image.network(
  //         randomImage,
  //         fit: BoxFit.cover,
  //       ),
  //     );

  // Widget get containerHeader => AnimatedContainer(
  //       width: MediaQuery.of(context).size.width,
  //       height: 130,
  //       duration: const Duration(milliseconds: 1000),
  //       child: headerImage,
  //     );

  // Widget get circleAvatar => AnimatedContainer(
  //       duration: const Duration(milliseconds: 400),
  //       child: Positioned(
  //         bottom: -55,
  //         left: 20,
  //         child: CircleAvatar(
  //           radius: isAppbarClose == true ? 25 : 45,
  //           backgroundColor: Colors.black,
  //           child: CircleAvatar(
  //             radius: isAppbarClose == true ? 20 : 40,
  //             backgroundImage: NetworkImage(avatarUrl),
  //           ),
  //         ),
  //       ),
  //     );

  Widget editProfileButton(title) => Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(width: 1, color: AppColors.white)),
            onPressed: () {},
            child: Text(
              title,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ),
      );

  Widget bioItems(title, icon) => Wrap(
        spacing: 5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            icon,
            size: 13,
            color: AppColors.grey,
          ),
          Text(
            title,
            style: themeBioText,
          )
        ],
      );

  Widget handles(title, handle) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w900),
          ),
          Text('@$handle', style: themeBioText),
        ],
      );

  Widget bio(location, link, date) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            children: [
              bioItems(location, Icons.location_pin),
              bioItems(link, Icons.insert_link_rounded),
            ],
          ),
          bioItems(date, Icons.calendar_month_rounded),
        ],
      );

  Widget get userInfo => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            spacing: 15,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              handles('Alihan Gedik', 'alihangedik'),
              const Text('Jr. Software Developer'),
              bio('Konya, Türkiye', 'github.com/AlihanGedik',
                  'Haziran 2020 tarihinde katıldı.'),
              followerRow
            ],
          ),
        ),
      );
}
