import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/colors.dart';

class SearchSetting extends StatefulWidget {
  const SearchSetting({super.key});

  @override
  State<SearchSetting> createState() => _SearchSettingState();
}

class _SearchSettingState extends State<SearchSetting> {
  bool isOpenLocation = true;
  bool isOpenCustomize = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Keşfetme ayarları', 'alihangedik'),
      body: Column(
        children: [
          headerText('Konum'),
          switchListTile(
              'Bu konumdaki içeriği göster',
              'Bu özellik etkin olduğunda, şu anda etrafında olup bitenleri\ngörürsün',
              isOpenLocation, (value) {
            setState(() {
              isOpenLocation = value;
            });
          }),
          const Divider(
            height: 10,
            color: AppColors.white,
          ),
          headerText('Kişiselleştirme'),
          switchListTile(
              'Gündemde ilgini çekebilecekler',
              'Gündemleri konumuna ve kimi takip ettiğine göre\nkişiselleştirebilirsin',
              isOpenCustomize, (value) {
            setState(() {
              isOpenCustomize = value;
            });
          })
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

  Widget switchListTile(title, subtitle, value, onChanged) => SwitchListTile(
      contentPadding: EdgeInsets.all(10),
      activeColor: AppColors.tweepink,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      value: value,
      onChanged: onChanged);

  Widget headerText(title) => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
}
