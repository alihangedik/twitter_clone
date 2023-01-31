import 'package:flutter/material.dart';
import 'package:twitter_clone/products/subject_items.dart';

import '../theme/colors.dart';

class SubjectRecommended extends StatelessWidget with SubjectItemsMixin {
  SubjectRecommended({super.key});

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
                headerText('Kategoriler'),
                subjectContainer,
                moreButton,
                divider,
                headerText('Sana özel'),
                moreSubject,
                divider,
                headerText('Eğlence'),
                moreSubject,
                divider,
                footer
              ],
            ),
          ))
        ],
      ),
    );
  }
}
