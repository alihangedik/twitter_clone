import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSize get profileTabBar => PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Material(
        color: Colors.white,
        child: TabBar(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.focused)
                  ? null
                  : Colors.white;
            },
          ),
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: true,
          indicatorWeight: 4,
          indicatorColor: AppColors.tweepinkLight,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child:
                  Text('Tweetler', style: TextStyle(color: AppColors.tweepink)),
            ),
            Tab(
              child: Text('Tweetler ve yanıtlar',
                  style: TextStyle(color: AppColors.tweepink)),
            ),
            Tab(
              child: Text('Medya', style: TextStyle(color: AppColors.tweepink)),
            ),
            Tab(
              child: Text('Beğeniler',
                  style: TextStyle(color: AppColors.tweepink)),
            ),
          ],
        ),
      ),
    );
