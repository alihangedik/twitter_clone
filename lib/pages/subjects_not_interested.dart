import 'package:flutter/material.dart';
import 'package:twitter_clone/products/subject_items.dart';

class SubjectsNotInterested extends StatelessWidget with SubjectItemsMixin {
  const SubjectsNotInterested({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return subjectListTile(
                  'Survivor Türkiye', 'Hayatta kalma yarışması', 'Takip et');
            },
          ),
          footer,
        ],
      ),
    );
  }
}
