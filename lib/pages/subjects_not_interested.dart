import 'package:flutter/material.dart';
import 'package:twitter_clone/products/subject_items.dart';

import '../theme/colors.dart';

class SubjectsNotInterested extends StatefulWidget {
  SubjectsNotInterested({super.key});

  @override
  State<SubjectsNotInterested> createState() => _SubjectsNotInterestedState();
}

class _SubjectsNotInterestedState extends State<SubjectsNotInterested>
    with SubjectItemsMixin {
  @override
  Widget build(BuildContext context) {
    List notInterested = [
      'Survivor Türkiye',
      'O Ses Türkiye',
      'Masterchef Türkiye'
    ];
    List<String> notInterestedSubtitle = [
      'Hayatta Kalma Yarışması',
      'Ses Yarışması',
      'Yemek Yarışması'
    ];
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: notInterested.length,
            itemBuilder: (BuildContext context, int index) {
              return subjectListTile(
                  notInterested[index],
                  notInterestedSubtitle[index],
                  '${isTap == true ? "Takip Ediliyor" : "Takip Et"}', () {
                setState(() {
                  isTap = !isTap;
                });
              },
                  isTap == true
                      ? MaterialStateProperty.all(AppColors.black)
                      : MaterialStateProperty.all(AppColors.white),
                  isTap == true ? AppColors.white : AppColors.black);
            },
          ),
          footer,
        ],
      ),
    );
  }
}
