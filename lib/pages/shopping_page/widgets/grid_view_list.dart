import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum OperateType {
  HOME,
  CATEGORY,
  SHOPPING,
  PERSONAL,
  PLUS,
  FLOAT_WINDOW,
  SEND_FRIEND,
  SHARE_FRIENDS,
  COLLECT,
  SEARCH,
  COPY_URL,
  OPEN_IN_BROWSER,
  TRANSLATE,
  MODIFY_FONT,
  REFRESH,
  COMPLAINT,
  SHARE_ENTERPRISE_WECHAT,
  SHARE_QQ,
  SHARE_QQ_ZORE,
}

class OperateItem {
  OperateItem({
    this.icon,
    this.activeIcon,
    this.title,
    this.isActive = false,
    this.value,
  });

  final String icon;
  final String activeIcon;
  final String title;
  bool isActive;
  OperateType value;

  bool isAvatarFromNet() {
    if (icon.startsWith('http') || icon.startsWith('https')) {
      return true;
    }
    return false;
  }
}

class CustomGridViewList extends StatelessWidget {
  var onTap;

  CustomGridViewList({Key key, this.onTap});

  List<OperateItem> items = <OperateItem>[
    OperateItem(
      icon: 'assets/images/ic_file_transfer.png',
      activeIcon: 'assets/images/ic_file_transfer.png',
      title: '购物首页',
      value: OperateType.HOME,
    ),
    OperateItem(
      icon: 'assets/images/ic_tx_news.png',
      activeIcon: 'assets/images/ic_tx_news.png',
      title: '商品分类',
      value: OperateType.CATEGORY,
    ),
    OperateItem(
      icon: 'assets/images/ic_wx_games.png',
      activeIcon: 'assets/images/ic_wx_games.png',
      title: '购物车',
      value: OperateType.SHOPPING,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '个人中心',
      value: OperateType.PERSONAL,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: '京东会员',
      value: OperateType.PLUS,
    ),
    OperateItem(
      icon: 'assets/images/ic_fengchao.png',
      activeIcon: 'assets/images/ic_fengchao.png',
      title: '浮窗',
      value: OperateType.FLOAT_WINDOW,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '发送给朋友',
      value: OperateType.SEND_FRIEND,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '分享到朋友圈',
      value: OperateType.SHARE_FRIENDS,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: '收藏',
      value: OperateType.COLLECT,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '搜索页面内容',
      value: OperateType.SEARCH,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/men/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '复制链接',
      value: OperateType.COPY_URL,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/10.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: '在浏览器打开',
      value: OperateType.OPEN_IN_BROWSER,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '全文翻译',
      value: OperateType.TRANSLATE,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '调整字体',
      value: OperateType.MODIFY_FONT,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '刷新',
      value: OperateType.REFRESH,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '投诉',
      value: OperateType.COMPLAINT,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '分享到企业微信',
      value: OperateType.SHARE_ENTERPRISE_WECHAT,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '分享到手机QQ',
      value: OperateType.SHARE_QQ,
    ),
    OperateItem(
      icon: 'https://randomuser.me/api/portraits/women/56.jpg',
      activeIcon: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: '分享到QQ空间',
      value: OperateType.SHARE_QQ_ZORE,
    ),
  ];

  Widget _getIcon(OperateItem item) {
    Widget _avatar;
    String _icon = item.isActive ? item.activeIcon : item.icon;
    if (item.isAvatarFromNet()) {
      _avatar = CachedNetworkImage(
        imageUrl: _icon,
        width: 40.0,
        height: 40.0,
      );
    } else {
      _avatar = Image.asset(
        _icon,
        width: 40.0,
        height: 40.0,
      );
    }
    return _avatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 359.0,
      padding: EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(4.0),
        children: items.map<Widget>((OperateItem item) {
          return InkWell(
            onTap: () {
              onTap(item.value);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _getIcon(item),
                Text(
                  item.title,
                  style: TextStyle(fontSize: 10.0),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
