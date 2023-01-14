import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String avatarUrl =
      'https://avatars.githubusercontent.com/u/71148065?s=400&u=cd2b1a170fa19d2b44518a53d745ef860427ce25&v=4';
  String randomImage = 'https://picsum.photos/200/300';
  String cardTitle =
      'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500 lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.';
  int defaultTabLength = 4;
  late ScrollController _scrollController;
  bool isHeaderClose = true;
  double lastOffset = 0;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = _scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = _scrollController.offset;
      });
      // print(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: SafeArea(
        child: DefaultTabController(
          length: defaultTabLength,
          child: Column(
            children: [
              _appBarSizedBox,
              _tabBar,
              _expandedListview,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add_rounded),
      );
  PreferredSizeWidget get _appBar => AppBar(
        title: _appBarItems('Home'),
        elevation: 0,
      );

  Widget _appBarItems(String title) => Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          Text(
            title,
            style: _titleTextStyle,
          )
        ],
      );
  Widget get _appBarSizedBox => AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _tabBar => const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.explore),
          ),
          Tab(
            icon: Icon(Icons.message),
          ),
        ],
      );

  Widget get _expandedListview => Expanded(
        child: _listview,
      );

  Widget get _listview => ListView.builder(
        itemCount: 10,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return _listviewCard;
        },
      );

  Widget get _listviewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(randomImage),
          ),
          title: Wrap(
            runSpacing: 10,
            children: [
              _listCardTitle('Hello'),
              Text(cardTitle),
              _placeholder,
              _cardIconRow
            ],
          ),
        ),
      );
  Widget _listCardTitle(String title) => Text(
        title,
        style: _titleTextStyle,
      );

  Widget get _placeholder => Container(
        height: 300,
        width: 300,
        child: Image.network(
          randomImage,
          fit: BoxFit.cover,
        ),
      );

  Widget get _cardIconRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        children: [
          const Icon(
            Icons.comment_outlined,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel('1'),
        onTap: () {},
      );

  final TextStyle _titleTextStyle =
      const TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
}
