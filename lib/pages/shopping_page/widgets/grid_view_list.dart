import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OperateItem {
  OperateItem({
    this.icon,
    this.activeIcon,
    this.title,
    this.isActive = false,
  });

  final String icon;
  final String activeIcon;
  final String title;
  bool isActive;

  bool isAvatarFromNet() {
    if (icon.startsWith('http') || icon.startsWith('https')) {
      return true;
    }
    return false;
  }
}

class CustomGridViewList extends StatelessWidget {
  List<OperateItem> items = <OperateItem>[
    OperateItem(
      icon: 'assets/images/ic_file_transfer.png',
      activeIcon: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
    ),
    OperateItem(
      icon: 'assets/images/ic_tx_news.png',
      activeIcon: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
    ),
    OperateItem(
      icon: 'assets/images/ic_wx_games.png',
      activeIcon: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
    ),
    OperateItem(
      icon: 'assets/images/ic_fengchao.png',
      activeIcon: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
    ),
  ];

  Widget _getIcon(OperateItem item) {
    Widget _avatar;
    String _icon = item.isActive ? item.activeIcon : item.icon;
    if (item.isAvatarFromNet()) {
      _avatar = CachedNetworkImage(
        imageUrl: _icon,
        width: 30.0,
        height: 30.0,
      );
    } else {
      _avatar = Image.asset(
        _icon,
        width: 30.0,
        height: 30.0,
      );
    }
    return _avatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(4.0),
        children: items.map<Widget>((OperateItem item) {
          return InkWell(
            child: Column(
              children: <Widget>[
                _getIcon(item),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(item.title),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
