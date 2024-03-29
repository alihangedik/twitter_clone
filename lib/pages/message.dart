import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/colors.dart';

class Message extends StatefulWidget {
  const Message(this.controller, {super.key});
  final ScrollController controller;
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String randomImageAvatar = "https://loremflickr.com/320/240";
  String twitterHandle = 'mlhkrtss';
  String twitterName = 'Mlhkrtss';
  String dummyMessage = 'Selam nasılsın 😃';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: messageList,
    );
  }

  Widget get messageList => RefreshIndicator(
        onRefresh: () {
          return Future.delayed(const Duration(milliseconds: 500));
        },
        child: ListView.builder(
          controller: widget.controller,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return _messageCard;
          },
        ),
      );

  Widget get _messageCard => Card(
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title: _messageCardTitle,
            leading: _messageCardLeading,
            trailing: _messageCardTrailing),
      );

  Widget get _messageCardTitle => Wrap(
        spacing: 5,
        children: [
          Text(
            twitterName,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 16, color: AppColors.tweepink),
          ),
          Text(
            '@$twitterHandle',
            style: TextStyle(color: AppColors.grey, fontSize: 15),
          ),
          Column(
            children: [Text(dummyMessage)],
          )
        ],
      );
  Widget get _messageCardLeading => CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(randomImageAvatar),
      );

  Widget get _messageCardTrailing => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Şimdi'),
          Container(
            decoration: BoxDecoration(
                color: AppColors.tweepink, shape: BoxShape.circle),
            width: 10,
            height: 10,
          ),
        ],
      );
}
