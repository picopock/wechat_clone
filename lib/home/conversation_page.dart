import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart'
    show mockConversations, Conversation, Device;

class _ConversationItem extends StatelessWidget {
  _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget _avatar;
    if (conversation.isAvatarFromNet()) {
      _avatar = Image.network(
        conversation.avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      _avatar = Image.asset(
        conversation.avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    Widget _avatarContainer;
    if (conversation.unReadMsgCount > 0) {
      // 未读消息角标
      Widget _unReadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center, // 文字居中显示
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(
          conversation.unReadMsgCount.toString(),
          style: AppStyles.UnreadMsgCountDotStyle,
        ),
      );

      // 头像容器，包括头像和角标
      _avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _avatar,
          Positioned(
            right: -Constants.UnReadMsgNotifyDotSize / 2.0,
            top: -5.0,
            child: _unReadMsgCountText,
          )
        ],
      );
    } else {
      _avatarContainer = _avatar;
    }

    // 勿扰模式图标
    Widget _muteIcon = Icon(
      IconData(
        0xe755,
        fontFamily: Constants.IconFontFamily,
      ),
      color: Color(AppColors.ConversationMuteIcon),
      size: Constants.ConversationMuteIconSize,
    );

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
            color: const Color(AppColors.DividerColor),
            width: Constants.DividerWidth,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: _avatarContainer,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyles.TitleStyle,
                ),
                Text(
                  conversation.desc,
                  style: AppStyles.DescStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                conversation.updateAt,
                style: AppStyles.DescStyle,
              ),
              conversation.isMute ? _muteIcon : Container()
            ],
          ),
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  final Device device;

  int get IconName {
    return device == Device.WIN ? 0xe75e : 0xe640;
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
                this.IconName,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 24.0,
              color: Color(AppColors.DeviceInfoItemIcon),
            ),
          ),
          Text(
            '微信已登录，手机通知已关闭。',
            style: AppStyles.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _DeviceInfoItem();
        }
        return _ConversationItem(
          conversation: mockConversations[index],
        );
      },
      itemCount: mockConversations.length,
    );
  }
}
