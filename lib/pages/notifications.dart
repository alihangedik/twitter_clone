import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';

class Notifications extends StatefulWidget {
  const Notifications(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Notifications> createState() => _NotificationsState();
}

String randomImage = "https://picsum.photos/200/300";
String twitterHandle = 'alperenozkan';
String cardTitle =
    'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.';

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: _fabButton,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          bottom: _tabBar,
        ),
        body: TabBarView(
          children: [
            _listviewSeparated,
            _listviewSeparated,
            _listviewSeparated,
          ],
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add_rounded),
      );

  PreferredSizeWidget get _tabBar => const TabBar(tabs: [
        Tab(child: Text('Tümü')),
        Tab(child: Text('Onaylanmış')),
        Tab(child: Text('Diğer')),
      ]);
  Widget get _listviewSeparated => RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(milliseconds: 500));
        },
        child: ListView.separated(
          controller: widget.controller,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _notificationCard;
          },
        ),
      );
  Widget get _notificationCard => Card(
        elevation: 0,
        child: ListTile(
            tileColor: Theme.of(context).scaffoldBackgroundColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(randomImage),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        twitterHandle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16),
                      ),
                      const Text('tweetini beğendi'),
                    ],
                  ),
                ),
                Text(cardTitle)
              ],
            ),
            leading: SvgPicture.string(
              AppIcons.like,
              height: 20,
              color: Colors.red[500],
            )),
      );
}
