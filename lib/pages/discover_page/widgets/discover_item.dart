import 'package:flutter/material.dart';

import '../../../constants.dart' show Constants, AppColors, AppStyles;

class DiscoverItem extends StatelessWidget {
  static const PADDING_LEFT = 20.0;
  static const PADDING_RIGHT = 10.0;
  static const VERTICAL_PADDING = 13.0;

  DiscoverItem({
    @required this.iconPath,
    @required this.title,
    this.showDivider: false,
    this.desc,
    @required this.onPressed,
  })  : assert(iconPath != null),
        assert(title != null),
        assert(onPressed != null);

  final String iconPath;
  final String title;
  final bool showDivider;
  final String desc;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final noBorderButton = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: PADDING_LEFT),
          child: Image.asset(
            iconPath,
            width: Constants.FullWidthIconButtonIconSize,
            height: Constants.FullWidthIconButtonIconSize,
          ),
        ),
        Expanded(child: Text(title)),
      ],
    );

    if (desc != null) {
      noBorderButton.children.add(
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text(
            desc,
            style: AppStyles.DescStyle,
          ),
        ),
      );
    }

    noBorderButton.children.add(Icon(
      Icons.keyboard_arrow_right,
      color: Colors.black38,
    ));

    final Widget borderButton = Container(
      padding: EdgeInsets.only(bottom: VERTICAL_PADDING),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: const Color(AppColors.DividerColor),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: noBorderButton,
    );

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
        left: PADDING_LEFT,
        right: PADDING_RIGHT,
        top: VERTICAL_PADDING,
        bottom: showDivider ? 0.0 : VERTICAL_PADDING,
      ),
      color: Colors.white,
      child: showDivider ? borderButton : noBorderButton,
    );
  }
}
