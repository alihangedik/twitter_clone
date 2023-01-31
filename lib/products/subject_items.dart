import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../icons.dart';
import '../theme/colors.dart';

mixin SubjectItemsMixin {
  Widget get headerInfoText => const Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Takip ettiğin Konular; gördüğün Tweet, etkinlik ve reklamları kişiselleştirmek için kullanılır ve profilinde herkese açık bir şekilde görünür.',
            style: TextStyle(fontSize: 13, color: AppColors.grey),
          ),
        ),
      );
  Widget get subjectList => ListView.builder(
      itemCount: 25,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) => subjectListTile(
          'Aksiyon ve macera filmleri', 'Film Türü', 'Takip Ediliyor')));

  Widget subjectListTile(title, subtitle, isFollow) => ListTile(
        trailing: OutlinedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
          onPressed: (() {}),
          child: Text(
            isFollow,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
        minVerticalPadding: 20,
        subtitle: Text(subtitle),
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.5),
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                color: AppColors.twitterBlue, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.string(
                AppIcons.subjectFill,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
        ),
      );

  Widget get subjectHeader => const ListTile(
        subtitle: Text(
          'Bunlar hakkında popüler Tweetleri Ana Sayfa zaman akışında görürsün',
          style: TextStyle(fontSize: 12),
        ),
        title: Text(
          'Tavsiye Edilen Konular',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      );

  Widget get moreSubject => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  subjectChip('Televizyon'),
                  subjectChip('Oyun Geliştirme'),
                  subjectChip('İş Dünyası ve finans'),
                  subjectChip('Psikoloji'),
                  subjectChip('FIFA'),
                  subjectChip('Rock'),
                ],
              ),
              Row(
                children: [
                  subjectChip('Müzik'),
                  subjectChip('Cristiano Ronaldo'),
                  subjectChip('Grammy Ödülleri'),
                  subjectChip('Sanat'),
                  subjectChip('Edebiyat ve kitaplar'),
                  subjectChip('Naruto'),
                ],
              ),
              Row(
                children: [
                  subjectChip('Video oyunları'),
                  subjectChip('Sinema ve televizyon'),
                  subjectChip('NASA'),
                  subjectChip('PlayStation'),
                  subjectChip('Sanat ve el işi'),
                  subjectChip('Evcil hayvanlar'),
                ],
              ),
            ],
          ),
        ),
      );
  Widget moreSubjectButton(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child:
            TextButton(onPressed: () {}, child: const Text('Daha Fazla Konu')),
      );

  Widget subjectChip(title) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.grey, width: 0.5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(title),
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.twitterBlue,
                  ),
                  const VerticalDivider(
                    endIndent: 5,
                    indent: 5,
                    width: 20,
                    color: AppColors.grey,
                  ),
                  const Icon(
                    Icons.close,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget get divider => const Divider();

  Widget headerText(title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
        child: Text(title),
      );

  Widget get subjectContainer => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 4 / 1.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              height: 170,
              width: 300,
              decoration: BoxDecoration(
                  color: AppColors.twitterBlue,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Moda ve Güzellik',
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            );
          },
        ),
      );

  Widget get moreButton => Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: const Text('Daha Fazla Göster'),
          ),
        ),
      );

  Widget get footer => Container(
        padding: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        child: const Text('●'),
      );
}
