import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/model/trends_model.dart';

import '../icons.dart';

class Search extends StatefulWidget {
  const Search(this.scrollController, {super.key});
  final ScrollController scrollController;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TrendsModel _trendsModel;
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
            _headerText,
            listviewSeparated(),
          ],
        ),
      ),
    );
  }

  ListView listviewSeparated() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
          Icons.more_vert_rounded,
          color: Colors.grey,
        )
      ],
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add_rounded),
      );

  Widget get _headerText => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Türkiye gündemleri',
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
        ),
      );
}
