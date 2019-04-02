import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final Color _color;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, Widget icon, Widget activeIcon, Color color})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        _color = color,
        item = BottomNavigationBarItem(
          icon: icon,
          title: Text(title),
          activeIcon: activeIcon,
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
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
        color: Colors.deepPurple,
      ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.book),
        activeIcon: Icon(Icons.bookmark),
        color: Colors.deepOrange,
      ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.find_in_page),
        activeIcon: Icon(Icons.access_alarm),
        color: Colors.teal,
      ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        color: Colors.pink,
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
            icon: Icon(Icons.search),
            onPressed: () {
              print('click');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
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
