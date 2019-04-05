import 'package:flutter/material.dart';

import '../../../constants.dart' show Constants, AppColors, AppStyles;

class ContactItem extends StatelessWidget {
  ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  static const double MARGIN_VERTICAL = 10.0;
  static const double GROUP_TITLE_HEIGHT = 24.0;

  bool get isAvatarFromNet {
    return avatar.startsWith('http') || avatar.startsWith('https');
  }

  static double height(bool hasGroupTitle) {
    double _buttonHeight = MARGIN_VERTICAL * 2 +
        Constants.ContactAvatarSize +
        Constants.DividerWidth;
    if (hasGroupTitle) {
      _buttonHeight += GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
  }

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = isAvatarFromNet
        ? Image.network(
            avatar,
            width: Constants.ContactAvatarSize,
            height: Constants.ContactAvatarSize,
          )
        : Image.asset(
            avatar,
            width: Constants.ContactAvatarSize,
            height: Constants.ContactAvatarSize,
          );

    Widget _button = Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0),
          Text(title),
        ],
      ),
    );

    return groupTitle != null
        ? Column(
            children: <Widget>[
              Container(
                height: GROUP_TITLE_HEIGHT,
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                color: const Color(AppColors.ContactGroupTitleBg),
                alignment: Alignment.centerLeft,
                child:
                    Text(groupTitle, style: AppStyles.GroupTitleItemTextStyle),
              ),
              _button
            ],
          )
        : _button;
  }
}
