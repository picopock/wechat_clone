import 'package:flutter/material.dart';
import '../constants.dart' show Constants, AppColors;

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final Color _color;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon, Color color})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        _color = color,
        item = BottomNavigationBarItem(
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
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
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
        color: AppColors.BackgroundColor,
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
        color: AppColors.BackgroundColor,
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
        color: AppColors.BackgroundColor,
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
        color: AppColors.BackgroundColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationIconView) =>
                  navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
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
          IconButton(
            icon: Icon(
              IconData(
                0xe658,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 22.0,
            ),
            onPressed: () {
              print('click add');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
