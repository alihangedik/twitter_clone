import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/products/subject_items.dart';

import '../icons.dart';
import '../theme/colors.dart';

class SubjectFollowers extends StatelessWidget with SubjectItemsMixin {
  const SubjectFollowers({super.key});

  @override
  Widget build(BuildContext context) {
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
                  subjectList,
                  divider,
                  subjectHeader,
                  moreSubject,
                  moreSubjectButton(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
