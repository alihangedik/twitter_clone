import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/theme/colors.dart';

import '../icons.dart';
import '../products/tweet_list.dart';
import '../view/tabbar_view.dart';
import 'full_screen_image.dart';

class TweetDetails extends StatefulWidget {
  ScrollController? controller;

  TweetDetails(this.controller, {super.key});

  @override
  State<TweetDetails> createState() => _TweetDetailsState();
}

class _TweetDetailsState extends State<TweetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: ListTile(contentPadding: EdgeInsets.zero, title: tweetSingle),
    );
  }

  Widget get tweetSingle => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: userListtile('Alihan Gedik', 'alihangedik')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Text(cardTitle),
          ),
          Expanded(flex: 16, child: detailImage),
          Expanded(flex: 1, child: date('20:39 30 Ara 22')),
          divider(20, 20),
          Expanded(
              flex: 2,
              child: statisticInfoRow('1237 Görüntüleme', '433 Beğeni')),
          divider(20, 20),
          Expanded(flex: 2, child: bottomIcons),
          divider(0, 0),
        ],
      );
  Widget userListtile(name, handle) => ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: const Icon(Icons.more_vert_rounded),
        title: Wrap(
          direction: Axis.vertical,
          children: [
            Text(name),
            Text('@$handle'),
          ],
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 40,
        ),
      );
  Widget get detailImage => Padding(
        padding: const EdgeInsets.all(22.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                            image: randomImage,
                          ))),
              child: Image.network(
                randomImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget date(date) => Padding(
        padding: EdgeInsets.only(left: 22.0),
        child: Text(date),
      );

  Widget statisticInfoRow(views, like) => Padding(
        padding: const EdgeInsets.only(left: 22.0),
        child: Wrap(
          spacing: 15,
          runAlignment: WrapAlignment.center,
          children: [
            Text(views),
            Text(like),
          ],
        ),
      );

  Widget divider(double indent, double endIndent) => Expanded(
      flex: 1,
      child: Divider(
        endIndent: endIndent,
        indent: indent,
        color: AppColors.white,
      ));

  Widget get bottomIcons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconLabel(AppIcons.comments),
          iconLabel(AppIcons.retweet),
          iconLabel(AppIcons.like),
          iconLabel(AppIcons.share),
        ],
      );
  Widget iconLabel(String icon) => Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 8,
        children: [
          InkWell(
            onTap: (() {
              setState(() {
                isTap = !isTap;
              });
            }),
            child: SvgPicture.string(
              icon,
              color: CupertinoColors.inactiveGray,
              height: 22,
            ),
          ),
        ],
      );
  AppBar get appbar {
    return AppBar(
      title: const Text('Tweet'),
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Divider(
            color: AppColors.white,
          )),
      centerTitle: false,
    );
  }
}
