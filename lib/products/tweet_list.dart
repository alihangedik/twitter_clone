import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/products/spaces.dart';

import '../icons.dart';
import '../theme/colors.dart';
import 'full_screen_image.dart';

class TweetList extends StatefulWidget {
  const TweetList(this.controller, {super.key});
  final ScrollController controller;

  @override
  State<TweetList> createState() => _TweetListState();
}

String randomImageAvatar = "https://loremflickr.com/320/240";
String randomImage = "https://picsum.photos/200/300";
String cardTitle =
    'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.';
int currentIndex = 0;
bool isTap = false;

class _TweetListState extends State<TweetList> with SpacesMixin {
  @override
  Widget build(BuildContext context) {
    return listview;
  }

  Widget get listview => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return listviewCard;
        },
      );
  Widget get listviewCard => Card(
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
                      listCardTitle('Alihan Gedik'),
                      lowWidth,
                      listCardHandle('alihangedik'),
                      listCardTime(' ・ 16h'),
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

  Widget listCardTitle(String title) => Text(
        title,
        style: titleTextStyle,
      );
  Widget listCardHandle(String title) => Text(
        '@$title',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.grey),
      );
  Widget listCardTime(String title) => Text(
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
          iconLabel('2', AppIcons.comments),
          iconLabel('34', AppIcons.retweet),
          iconLabel('433', AppIcons.like),
          iconLabel('', AppIcons.share),
        ],
      );

  Widget iconLabel(String text, String icon) => Wrap(
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
              height: 18,
            ),
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
  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: AppColors.white);
}
