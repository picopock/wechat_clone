import 'package:flutter/material.dart';

import '../../../constants.dart' show Constants, AppColors, AppStyles;

class DiscoverItem extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
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
          padding: EdgeInsets.only(right: HORIZONTAL_PADDING),
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
      noBorderButton.children.add(Text(
        desc,
        style: AppStyles.DescStyle,
      ));
    }

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
          left: HORIZONTAL_PADDING,
          right: HORIZONTAL_PADDING,
          top: VERTICAL_PADDING,
          bottom: showDivider ? 0.0 : VERTICAL_PADDING),
      color: Colors.white,
      child: showDivider ? borderButton : noBorderButton,
    );
  }
}
