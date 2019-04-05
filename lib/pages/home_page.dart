import 'package:flutter/material.dart';

import '../constants.dart' show Constants, AppColors;

import './conversation_page/index.dart';
import './contact_page/index.dart';
import './discover_page/index.dart';
import './mine_page/index.dart';

enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP,
}

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon, Color color})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title),
          activeIcon: Icon(activeIcon),
          backgroundColor: color,
        );
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        title: '微信',
        icon: IconData(0xe608, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe603, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(0xe601, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe656, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(0xe600, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe671, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(0xe6c0, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe626, fontFamily: Constants.IconFontFamily),
      ),
    ];
    _pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
    _pages = [
      ConversationPage(),
      ContactsPage(),
      DiscoverPage(),
      MinePage(),
    ];
  }

  _buildPopupMenuItem(String title, {int iconName, String iconPath}) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 12.0),
          child: iconPath != null
              ? Image.asset(
                  iconPath,
                  width: 22.0,
                  height: 22.0,
                  color: const Color(AppColors.AppBarPopupMenuColor),
                )
              : Icon(
                  IconData(
                    iconName,
                    fontFamily: Constants.IconFontFamily,
                  ),
                  size: 22.0,
                  color: const Color(AppColors.AppBarPopupMenuColor),
                ),
        ),
        Text(
          title,
          style: TextStyle(
            color: const Color(AppColors.AppBarPopupMenuColor),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationIconView) =>
                  navigationIconView.item)
          .toList(),
      fixedColor: const Color(AppColors.TabIconActive),
      currentIndex: _currentIndex,
      type: _type,
      iconSize: 24.0,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0, // 去掉阴影
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 22.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem('发起群聊', iconName: 0xe69e),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem('添加朋友', iconName: 0xe638),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem('扫一扫', iconName: 0xe61b),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem('收付款', iconName: 0xe62a),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem('帮助与反馈', iconName: 0xe63b),
                  value: ActionItems.HELP,
                )
              ];
            },
            icon: Icon(
              IconData(
                0xe658,
                fontFamily: Constants.IconFontFamily,
              ),
            ),
            onSelected: (ActionItems selected) {
              print('点击的是 $selected');
            },
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
