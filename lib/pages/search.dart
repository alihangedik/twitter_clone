import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/model/trends_model.dart';
import 'package:twitter_clone/pages/notifications.dart';

import '../icons.dart';

class Search extends StatefulWidget {
  const Search(this.scrollController, {super.key});
  final ScrollController scrollController;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TrendsModel _trendsModel;
  final String _imageText = 'Tenis Turnuvası ・ CANLI';
  final String _bigImageText = 'Australian Open 2023';
  @override
  void initState() {
    super.initState();
    _trendsModel = TrendsModel(
        hashtag: '#alihangedik',
        category: 'Gündemdekiler',
        tweetCount: '530B Tweet');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 500));
      },
      child: Scaffold(
        floatingActionButton: _fabButton,
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: [
            _headerImage,
            _headerText,
            listviewSeparated(),
          ],
        ),
      ),
    );
  }

  Widget get _headerImage => Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              randomImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 130,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _imageText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  _bigImageText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          )
        ],
      );

  ListView listviewSeparated() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: listCard(context),
        );
      },
    );
  }

  Card listCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: listRow(context),
    );
  }

  Row listRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            spacing: 4,
            direction: Axis.vertical,
            children: [
              Text(
                _trendsModel.category ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 13, color: Colors.grey),
              ),
              Text(
                _trendsModel.hashtag ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 16),
              ),
              Text(
                _trendsModel.tweetCount ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.more_horiz_rounded,
          color: Colors.grey,
        )
      ],
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: (() {}),
        child: SvgPicture.string(
          AppIcons.fabTweet,
          color: Colors.white,
        ),
      );

  Widget get _headerText => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Text(
          'Senin için trendler',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      );
}
