import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/products/home_tabbar.dart';
import 'package:twitter_clone/products/spaces.dart';
import 'package:twitter_clone/theme/colors.dart';

import '../products/full_screen_image.dart';

class Home extends StatefulWidget {
  const Home(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SpacesMixin {
  String randomImageAvatar = "https://loremflickr.com/320/240";
  String randomImage = "https://picsum.photos/200/300";
  String cardTitle =
      'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: tabBar,
          toolbarHeight: 0,
        ),
        body: TabBarView(children: [_listview, _listview]),
      ),
    );
  }

  Widget get _listview => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (BuildContext context, int index) {
          return _listviewCard;
        },
      );

  Widget get _listviewCard => Card(
        elevation: 0,
        child: ListTile(
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(randomImageAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _listCardTitle('Alihan Gedik'),
                      lowWidth,
                      _listCardHandle('alihangedik'),
                      _listCardTime(' ・ 16h'),
                      midWidth,
                      const Icon(
                        Icons.more_horiz,
                        size: 17,
                      )
                    ],
                  ),
                  Text(cardTitle),
                  lowHeight,
                  _placeholder,
                  lowHeight,
                  cardIconRow,
                ],
              ),
            ),
          ),
        ),
      );
  Widget _listCardTitle(String title) => Text(
        title,
        style: titleTextStyle,
      );
  Widget _listCardHandle(String title) => Text(
        '@$title',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.white),
      );
  Widget _listCardTime(String title) => Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      );
  Widget get _placeholder => SizedBox(
        height: 300,
        width: 300,
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
      );

  Widget get cardIconRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconLabelButton('2', AppIcons.comments),
          iconLabelButton('34', AppIcons.retweet),
          iconLabelButton('433', AppIcons.like),
          iconLabelButton('', AppIcons.share),
        ],
      );

  Widget iconLabel(String text, String icon) => Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 8,
        children: [
          SvgPicture.string(
            icon,
            color: CupertinoColors.inactiveGray,
            height: 18,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.grey),
          ),
        ],
      );

  Widget iconLabelButton(String text, String icon) => InkWell(
        child: iconLabel(text, icon),
        onTap: () {},
      );

  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: AppColors.white);
}
