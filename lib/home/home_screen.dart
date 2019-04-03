import 'package:flutter/material.dart';
import '../constants.dart' show Constants, AppColors;

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

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
    _pageController = PageController(
      initialPage: _currentIndex,
    );
    _pages = [
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
      Container(
        color: Colors.pink,
      ),
      Container(
        color: Colors.white,
      ),
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(
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
              print('click');
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe638, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe61b, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe62a, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe63b, '帮助与反馈'),
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
