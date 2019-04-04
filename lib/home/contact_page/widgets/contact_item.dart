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

  bool get isAvatarFromNet {
    return avatar.startsWith('http') || avatar.startsWith('https');
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
      padding: EdgeInsets.symmetric(vertical: 10.0),
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
                padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
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
