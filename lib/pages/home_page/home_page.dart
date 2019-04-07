import 'package:flutter/material.dart';

import '../../constants.dart' show Constants, AppColors;

import './widgets/navigation_icon_view.dart';
import '../conversation_page/index.dart';
import '../contact_page/index.dart';
import '../discover_page/index.dart';
import '../mine_page/index.dart';

enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP,
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
        iconCode: 0xe608,
        activeIconCode: 0xe603,
      ),
      NavigationIconView(
        title: '通讯录',
        iconCode: 0xe601,
        activeIconCode: 0xe656,
      ),
      NavigationIconView(
        title: '发现',
        iconCode: 0xe600,
        activeIconCode: 0xe671,
      ),
      NavigationIconView(
        title: '我',
        iconCode: 0xe6c0,
        activeIconCode: 0xe626,
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

  String get _getAppBarTitle {
    return _navigationViews[_currentIndex].title;
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
      appBar: _currentIndex != 3
          ? AppBar(
              title: Text(
                _getAppBarTitle,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
              elevation: 0.0, // 去掉阴影
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  icon: Icon(
                    IconData(
                      0xe65e,
                      fontFamily: Constants.IconFontFamily,
                    ),
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
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
                  offset: Offset(0.0, 60.0),
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  icon: Icon(Icons.add_circle_outline, size: 30.0),
                  onSelected: (ActionItems selected) {
                    print('点击的是 $selected');
                  },
                ),
              ],
            )
          : AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.photo_camera),
                  color: Colors.black,
                  onPressed: () {
                    print('camera pressed!');
                  },
                )
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
