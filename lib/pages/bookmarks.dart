import 'package:flutter/material.dart';

import '../theme/colors.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    String image =
        'https://abs.twimg.com/responsive-web/client-web/book-in-bird-cage-800x400.v1.71804389.png';
    String headerTitle = 'Tweetleri daha sonrası için kaydet';
    String title =
        'İyi Tweetlerin kaybolup gitmesine izin verme! Gelecekte kolayca bulabilmek için Tweetleri yer işaretlerine ekle.';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yer İşaretleri'),
        actions: const [Icon(Icons.more_vert)],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0), child: Divider()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.network(
                image,
              ),
            ),
            Column(
              children: [
                Text(
                  headerTitle,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    title,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
