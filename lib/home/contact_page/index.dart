import 'package:flutter/material.dart';

import './widgets/contact_item.dart';

import '../../constants.dart' show Constants;
import '../../modal/contact.dart' show Contact, ContactPageData;

const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class ContactsPage extends StatefulWidget {
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactPageData _data = ContactPageData.mock();
  final List<Contact> _contacts = [];
  final List<ContactItem> _functionButtons = [
    ContactItem(avatar: 'assets/images/ic_new_friend.png', title: '新的朋友'),
    ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
    ),
    ContactItem(avatar: 'assets/images/ic_tag.png', title: '标签'),
    ContactItem(avatar: 'assets/images/ic_public_account.png', title: '公众号'),
  ];

  @override
  void initState() {
    super.initState();
    _contacts
      ..addAll(_data.contacts)
      ..addAll(_data.contacts)
      ..addAll(_data.contacts);
    _contacts
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
  }

  @override
  Widget build(BuildContext context) {
    int len = _functionButtons.length;
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String letter) {
      return Expanded(
        child: Text(letter),
      );
    }).toList();

    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < len) {
              return _functionButtons[index];
            }

            int _contactIndex = index - len;
            Contact _contact = _contacts[_contactIndex];

            bool _isGroupTitle = true;
            if (_contactIndex > 0 &&
                _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
              _isGroupTitle = false;
            }

            return ContactItem(
              avatar: _contact.avatar,
              title: _contact.name,
              groupTitle: _isGroupTitle ? _contact.nameIndex : null,
            );
          },
          itemCount: _contacts.length + len,
        ),
        Positioned(
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          width: Constants.IndexBarWidth,
          child: Column(
            children: _letters,
          ),
        ),
      ],
    );
  }
}
