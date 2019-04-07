import 'package:flutter/material.dart';

import './widgets/conversation_item.dart';
import './widgets/device_info.dart';

import './conversation_data.dart' show ConversationPageData;

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>
    with AutomaticKeepAliveClientMixin {
  final ConversationPageData data = ConversationPageData.mock();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var mockConversations = data.conversations;

    return Theme(
      data: Theme.of(context).copyWith(cardColor: Colors.white), // 修改 卡片颜色
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (data.device != null && index == 0) {
            return DeviceInfoItem(
              device: data.device,
            );
          }
          return ConversationItem(
            conversation:
                mockConversations[data.device == null ? index : index - 1],
          );
        },
        itemCount: data.device == null
            ? mockConversations.length
            : mockConversations.length + 1,
      ),
    );
  }
}
