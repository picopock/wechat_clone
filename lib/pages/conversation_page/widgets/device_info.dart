import 'package:flutter/material.dart';

import '../conversation_data.dart' show Device;
import '../../../constants.dart' show Constants, AppColors, AppStyles;

class DeviceInfoItem extends StatelessWidget {
  const DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  final Device device;

  int get iconName {
    return device == Device.WIN ? 0xe75e : 0xe640;
  }

  String get deviceName {
    return device == Device.WIN ? 'windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor),
          ),
        ),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0),
            child: Icon(
              IconData(
                iconName,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 24.0,
              color: Color(AppColors.DeviceInfoItemIcon),
            ),
          ),
          Text(
            '$deviceName 微信已登录，手机通知已关闭。',
            style: AppStyles.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}
