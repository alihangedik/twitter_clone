import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSizeWidget get tabBar => const TabBar(
      indicatorWeight: 4,
      indicatorColor: AppColors.twitterBlue,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Tab(
            child: Text(
          'Senin İçin',
        )),
        Tab(
            child: Text(
          'Takip Edilen',
        )),
      ],
    );
