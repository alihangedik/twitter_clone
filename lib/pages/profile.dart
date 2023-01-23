import 'package:flutter/material.dart';
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

  appbarPosition() {
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        isAppbarClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
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
    // TODO: implement initState
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
    return Scaffold(
        body: Column(
      children: [
        containerAppbar,
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          containerHeader,
                          circleAvatar,
                        ],
                      ),
                      editProfileButton('Profili Düzenle'),
                      userInfo,
                      TweetList(widget.controller),
                      // profileTabBar,
                    ],
                  ),
                  // Expanded(
                  //   child: TabBarView(children: [
                  //     TweetList(widget.controller),
                  //     TweetList(widget.controller),
                  //     TweetList(widget.controller),
                  //     TweetList(widget.controller),
                  //   ]),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget get appbar => AppBar(
        title: Text('Alihan Gedik'),
        toolbarOpacity: isAppbarClose == true ? 1 : 0,
        toolbarHeight: isAppbarClose == true ? 50 : 0,
      );
  Widget get containerAppbar => AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: 130,
        duration: const Duration(milliseconds: 1000),
        child: appbar,
      );
  Widget get headerImage => SizedBox(
        child: Image.network(
          randomImage,
          fit: BoxFit.cover,
        ),
      );

  Widget get containerHeader => AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: 130,
        duration: const Duration(milliseconds: 1000),
        child: headerImage,
      );

  Widget get circleAvatar => Positioned(
        bottom: isAppbarClose == true ? -30 : -60,
        left: 20,
        child: CircleAvatar(
          radius: isAppbarClose == true ? 25 : 45,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: isAppbarClose == true ? 20 : 40,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
      );

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
        child: Container(
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
