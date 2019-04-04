import 'package:flutter/material.dart';

import '../../../constants.dart' show Constants, AppColors;

class ContactItem extends StatelessWidget {
  ContactItem({@required this.avatar, @required this.title, this.groupTitle});

  final String avatar;
  final String title;
  final String groupTitle;

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = Image.network(
      avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
    );

    return Container(
      padding: EdgeInsets.only(right: 16.0, left: 16.0),
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: Constants.DividerWidth,
              color: const Color(AppColors.DividerColor),
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
      ),
    );
  }
}
