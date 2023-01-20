import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/pages/notifications.dart';

import 'package:twitter_clone/theme/colors.dart';

import '../icons.dart';
import '../pages/home.dart';

class FullScreenImage extends StatelessWidget {
  final String image;

  const FullScreenImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_rounded,
                      size: 55,
                    )),
              ),
            ),
            Positioned(
              top: 40,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Row(
                children: [cardIconRow],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get cardIconRow => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconLabelButton('2', AppIcons.comments),
              iconLabelButton('34', AppIcons.retweet),
              iconLabelButton('433', AppIcons.like),
              iconLabelButton('26562', AppIcons.views),
              iconLabelButton('', AppIcons.share),
            ],
          ),
        ),
      );

  Widget iconLabel(String text, String icon) => Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 8,
        children: [
          SvgPicture.string(
            icon,
            color: AppColors.white,
            height: 18,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.white),
          ),
        ],
      );

  Widget iconLabelButton(String text, String icon) => InkWell(
        child: iconLabel(text, icon),
        onTap: () {},
      );
}
