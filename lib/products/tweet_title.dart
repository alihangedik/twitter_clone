import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/products/spaces.dart';
import 'package:twitter_clone/products/tweet_list.dart';

import '../icons.dart';
import '../pages/full_screen_image.dart';
import '../theme/colors.dart';

class TweetTitle extends StatefulWidget with SpacesMixin {
  TweetTitle({super.key});

  @override
  State<TweetTitle> createState() => _TweetTitleState();
}

class _TweetTitleState extends State<TweetTitle> {
  @override
  Widget build(BuildContext context) {
    return tweetItems;
  }

  Padding get tweetItems {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listCardTitle('Alperen Özkan'),
              listCardHandle('alperenozkan'),
              listCardTime(' ・ 16h'),
              const Icon(
                Icons.more_horiz,
                size: 17,
              )
            ],
          ),
          Text(cardTitle),
          placeholder,
          cardIconRow,
        ],
      ),
    );
  }

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

  Widget get placeholder => SizedBox(
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
