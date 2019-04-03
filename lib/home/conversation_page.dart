import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart' show mockConversations, Conversation;

class _ConversationItem extends StatelessWidget {
  _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/default_nor_avatar.png',
              width: Constants.ConversationAvatarSize,
              height: Constants.ConversationAvatarSize,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyles.TitleStyle,
                ),
                Text(
                  conversation.desc,
                  style: AppStyles.DescStyle,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                conversation.updateAt,
                style: AppStyles.DescStyle,
              ),
              Text(
                conversation.updateAt,
                style: AppStyles.DescStyle,
              ),
            ],
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
        return _ConversationItem(
          conversation: mockConversations[index],
        );
      },
      itemCount: mockConversations.length,
    );
  }
}
