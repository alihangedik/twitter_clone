import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/icons.dart';
import 'package:twitter_clone/theme/colors.dart';

class NotificationsSetting extends StatefulWidget {
  const NotificationsSetting({super.key});

  @override
  State<NotificationsSetting> createState() => _NotificationsSettingState();
}

class _NotificationsSettingState extends State<NotificationsSetting> {
  bool isOpenLocation = true;
  bool isOpenCustomize = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Bildirim ayarları', 'alihangedik'),
      body: Column(
        children: [
          headerText(
              'Etkinliklerin, ilgi alanların ve önerilerin hakkında aldığın bildirim türlerini seç.'),
          switchListTile(
              'Filtreler',
              'Görmek istediğin ve istemediğin bildirimleri seç.',
              AppIcons.filter),
          switchListTile('Tercihler', 'Bildirim türüne göre tercihleri seç.',
              AppIcons.preferences)
        ],
      ),
    );
  }

  PreferredSizeWidget appbar(String title, String handle) => AppBar(
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.4),
            child: Divider(
              height: 2,
              color: AppColors.white,
            )),
        title: Wrap(direction: Axis.vertical, children: [
          Text(title),
          Text(
            '@$handle',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 17, color: AppColors.grey),
          ),
        ]),
      );

  Widget switchListTile(
    title,
    subtitle,
    String value,
  ) =>
      ListTile(
        leading: SvgPicture.string(
          value,
          color: AppColors.grey,
          height: 30,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );

  Widget headerText(title) => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 11),
          ),
        ),
      );
}
