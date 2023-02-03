import 'package:flutter/material.dart';

import 'package:twitter_clone/products/subject_items.dart';

class SubjectFollowers extends StatefulWidget {
  SubjectFollowers({super.key});

  @override
  State<SubjectFollowers> createState() => _SubjectFollowersState();
}

class _SubjectFollowersState extends State<SubjectFollowers>
    with SubjectItemsMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerInfoText,
                  divider,
                  subjectList(() {
                    setState(() {
                      isTap = !isTap;
                    });
                  }),
                  divider,
                  subjectHeader,
                  moreSubject,
                  moreSubjectButton(context, () {
                    setState(() {
                      tabController.index = 1;
                    });
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
