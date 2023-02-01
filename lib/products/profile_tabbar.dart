import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSize get profileTabBar => PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Material(
        color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.01),
        child: TabBar(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.focused)
                  ? null
                  : Colors.transparent;
            },
          ),
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: true,
          indicatorWeight: 4,
          indicatorColor: AppColors.twitterBlue,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(
              child: Text('Tweetler'),
            ),
            Tab(
              child: Text('Tweetler ve yanıtlar'),
            ),
            Tab(
              child: Text('Medya'),
            ),
            Tab(
              child: Text('Beğeniler'),
            ),
          ],
        ),
      ),
    );
