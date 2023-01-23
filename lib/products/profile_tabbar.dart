import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSizeWidget get profileTabBar => const TabBar(
      physics: NeverScrollableScrollPhysics(),
      isScrollable: true,
      indicatorWeight: 4,
      indicatorColor: AppColors.twitterBlue,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
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
    );
