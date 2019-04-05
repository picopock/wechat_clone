import 'package:flutter/material.dart';

import '../../../constants.dart' show AppColors, AppStyles;
import '../../../modal/mine.dart' show me;

class Header extends StatelessWidget {
  static const double AVATAR_SIZE = 72.0;
  static const double VERTICAL_PADDING = 16.0;
  static const double HORIZONTAL_PADDING = 10.0;
  static const double QR_CODE_PREV_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: AppColors.HeaderCardBg,
      padding: EdgeInsets.fromLTRB(HORIZONTAL_PADDING, VERTICAL_PADDING,
          HORIZONTAL_PADDING, VERTICAL_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: VERTICAL_PADDING),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Image.network(
              me.avatar,
              width: AVATAR_SIZE,
              height: AVATAR_SIZE,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    me.name,
                    style: AppStyles.HeaderCardTitleTextStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '微信号：${me.account}',
                    style: AppStyles.HeaderCardDescTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/ic_qrcode_preview_tiny.png',
            width: QR_CODE_PREV_SIZE,
            height: QR_CODE_PREV_SIZE,
          ),
        ],
      ),
    );
  }
}
