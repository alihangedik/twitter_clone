import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/subject_recommended.dart';
import 'package:twitter_clone/pages/subjects_followers.dart';
import 'package:twitter_clone/pages/subjects_not_interested.dart';

import 'package:twitter_clone/theme/colors.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Konular'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: const [
                Divider(
                  height: 50,
                  color: AppColors.grey,
                ),
                TabBar(
                  labelPadding: EdgeInsets.only(bottom: 15),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.twitterBlue,
                  tabs: [
                    Text('Takip Edilenler'),
                    Text('Önerilenler'),
                    Text('İlgilenmiyorum'),
                  ],
                ),
                Divider(
                  height: 0,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const SubjectFollowers(),
            SubjectRecommended(),
            const SubjectsNotInterested()
          ],
        ),
      ),
    );
  }
}