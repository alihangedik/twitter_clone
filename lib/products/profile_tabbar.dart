import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSize get profileTabBar => PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Material(
        color: AppColors.black.withOpacity(0.01),
        child: const TabBar(
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
        ),
      ),
    );
