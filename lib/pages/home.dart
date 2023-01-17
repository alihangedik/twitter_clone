import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';

class Home extends StatefulWidget {
  const Home(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String randomImageAvatar = "https://loremflickr.com/320/240";
  String randomImage = "https://picsum.photos/200/300";
  String cardTitle =
      'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500 lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.\n#lorem #ipsum';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: _fabButton, body: _listview);
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: (() {}),
        child: SvgPicture.string(AppIcons.fabTweet),
      );

  Widget get _listview => ListView.builder(
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (BuildContext context, int index) {
          return _listviewCard;
        },
      );

  Widget get _listviewCard => Card(
        elevation: 0,
        child: ListTile(
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(randomImageAvatar),
          ),
          title: Wrap(
            runSpacing: 10,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listCardTitle('Alihan Gedik'),
                  _listCardHandle('alihangedik'),
                ],
              ),
              Text(cardTitle),
              _placeholder,
              _cardIconRow,
              const Divider()
            ],
          ),
        ),
      );
  Widget _listCardTitle(String title) => Text(
        title,
        style: titleTextStyle,
      );
  Widget _listCardHandle(String title) => Text(
        '@$title',
        style: Theme.of(context).textTheme.bodySmall,
      );
  Widget get _placeholder => SizedBox(
        height: 300,
        width: 300,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            randomImage,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget get _cardIconRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconLabelButton('1424', AppIcons.views),
          _iconLabelButton('2', AppIcons.comments),
          _iconLabelButton('34', AppIcons.retweet),
          _iconLabelButton('433', AppIcons.like),
          _iconLabelButton('', AppIcons.share),
        ],
      );

  Widget _iconLabel(String text, String icon) => Wrap(
        spacing: 8,
        children: [
          SvgPicture.string(
            icon,
            color: CupertinoColors.inactiveGray,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      );

  Widget _iconLabelButton(String text, String icon) => InkWell(
        child: _iconLabel(text, icon),
        onTap: () {},
      );
  final TextStyle titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
}
