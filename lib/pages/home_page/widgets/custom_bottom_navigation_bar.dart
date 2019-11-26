import 'package:flutter/material.dart';
import '../../../constants.dart' show Constants, AppColors;

class CustomBottomNavigationBarItem {
  final int index;
  final String title;
  final int iconCode;
  final int activeIconCode;

  CustomBottomNavigationBarItem({
    Key key,
    @required this.index,
    @required this.title,
    @required this.iconCode,
    @required this.activeIconCode,
  });
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<CustomBottomNavigationBarItem> items;
  final Function onTap;
  final Color defaultColor;
  final Color activeColor;
  final double iconSize;

  CustomBottomNavigationBar({
    @required this.currentIndex,
    @required this.items,
    this.defaultColor = Colors.black54,
    this.activeColor = const Color(AppColors.TabIconActive),
    this.iconSize,
    this.onTap,
  });

  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items.map<GestureDetector>((CustomBottomNavigationBarItem item) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 10.0),
              height: 55.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    IconData(
                      currentIndex == item.index
                          ? item.activeIconCode
                          : item.iconCode,
                      fontFamily: Constants.IconFontFamily,
                    ),
                    color: currentIndex == item.index
                        ? const Color(AppColors.TabIconActive)
                        : Colors.black54,
                    size: iconSize,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: currentIndex == item.index
                          ? const Color(AppColors.TabIconActive)
                          : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              onTap(item);
            },
          );
        }).toList(),
      ),
    );
  }
}
