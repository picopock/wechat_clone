import 'package:flutter/material.dart';

import '../../../constants.dart' show Constants;

class NavigationIconView {
  final BottomNavigationBarItem item;
  final String title;

  NavigationIconView(
      {Key key, this.title, int iconCode, int activeIconCode, Color color})
      : item = BottomNavigationBarItem(
          icon: Icon(IconData(iconCode, fontFamily: Constants.IconFontFamily)),
          title: Text(title),
          activeIcon: Icon(
              IconData(activeIconCode, fontFamily: Constants.IconFontFamily)),
          backgroundColor: color,
        );
}
