import 'package:flutter/material.dart';

import '../../constants.dart' show AppColors;

import './widgets/header.dart';
import '../discover_page/widgets/discover_item.dart';

class MinePage extends StatefulWidget {
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  static const double SEPARATOR_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            SizedBox(height: SEPARATOR_SIZE),
            DiscoverItem(
              iconPath: 'assets/images/ic_wallet.png',
              title: '钱包',
              onPressed: () {
                print('点击的是钱包按钮。');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            DiscoverItem(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showDivider: true,
              onPressed: () {
                print('点击的是收藏按钮。');
              },
            ),
            DiscoverItem(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showDivider: true,
              onPressed: () {
                print('点击的是相册按钮。');
              },
            ),
            DiscoverItem(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: '卡包',
              showDivider: true,
              onPressed: () {
                print('打开卡包应用');
              },
            ),
            DiscoverItem(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              onPressed: () {
                print('打开表情应用');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            DiscoverItem(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              desc: '账号未保护',
              onPressed: () {
                print('打开设置');
              },
            ),
          ],
        ),
      ),
    );
  }
}
