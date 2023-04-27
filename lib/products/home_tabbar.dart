import 'package:flutter/material.dart';

import '../theme/colors.dart';

PreferredSizeWidget get tabBar => TabBar(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return states.contains(MaterialState.focused)
              ? null
              : Colors.transparent;
        },
      ),
      indicatorWeight: 4,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.tweepinkLight,
      tabs: const [
        Tab(
            child: Text(
          'Senin İçin 🤍',
        )),
        Tab(
            child: Text(
          'Takip Edilen  🤍',
        )),
      ],
    );
