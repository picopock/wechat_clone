import 'package:flutter/material.dart';

import './widgets/contact_item.dart';

import '../../constants.dart' show Constants, AppColors, AppStyles;
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
  Color _indexBarBg = Colors.transparent;
  String _currentLetter = '';

  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ScrollController _scrollController;
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
  final Map<String, double> _letterPositionMap = {INDEX_BAR_WORDS[0]: 0.0};

  @override
  void initState() {
    super.initState();
    _contacts
      ..addAll(_data.contacts)
      ..addAll(_data.contacts)
      ..addAll(_data.contacts);
    _contacts
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));

    _scrollController = ScrollController();

    // 计算用于 indexBar 进行定位的关键通讯录列表项的位置
    double _totalPosition = _functionButtons.length * ContactItem.height(false);
    for (int i = 0, len = _contacts.length; i < len; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0) {
        _hasGroupTitle = false;
      }

      if (_hasGroupTitle) {
        _letterPositionMap[_contacts[i].nameIndex] = _totalPosition;
      }

      _totalPosition += ContactItem.height(_hasGroupTitle);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String getLetter(
      BuildContext context, int tileHeight, Offset globalPosition) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPosition);
    int index = (local.dy ~/ tileHeight)
        .clamp(0, INDEX_BAR_WORDS.length - 1); // clamp 限制范围，防止溢出
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if (_letterPositionMap.isNotEmpty) {
      final _pos = _letterPositionMap[letter];

      if (_pos != null) {
        _scrollController.animateTo(
          _pos,
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 200),
        );
      }
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS
        .map((String letter) => Expanded(child: Text(letter)))
        .toList();

    final _totalHeight = constraints.biggest.height;
    final _tileHeight = _totalHeight ~/ _letters.length; // 取整

    return Container(
      color: widget._indexBarBg,
      child: GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          setState(() {
            widget._indexBarBg = Colors.black26;
            widget._currentLetter =
                getLetter(context, _tileHeight, details.globalPosition);
            _jumpToIndex(widget._currentLetter);
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            widget._currentLetter =
                getLetter(context, _tileHeight, details.globalPosition);
            _jumpToIndex(widget._currentLetter);
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            widget._indexBarBg = Colors.transparent;
            widget._currentLetter = '';
          });
        },
        onVerticalDragCancel: () {
          setState(() {
            widget._indexBarBg = Colors.transparent;
            widget._currentLetter = '';
          });
        },
        child: Column(
          children: _letters,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int len = _functionButtons.length;
    final List<Widget> _children = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index < len) {
            return _functionButtons[index];
          }

          int _contactIndex = index - len;
          Contact _contact = _contacts[_contactIndex];

          bool _hasGroupTitle = true;
          if (_contactIndex > 0 &&
              _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
            _hasGroupTitle = false;
          }

          return ContactItem(
            avatar: _contact.avatar,
            title: _contact.name,
            groupTitle: _hasGroupTitle ? _contact.nameIndex : null,
          );
        },
        itemCount: _contacts.length + len,
      ),
      Positioned(
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        width: Constants.IndexBarWidth,
        child: LayoutBuilder(
          builder: _buildIndexBar,
        ),
      ),
    ];

    if (widget._currentLetter != null && widget._currentLetter.isNotEmpty) {
      Widget _selectLetter = Center(
        child: Container(
          width: Constants.IndexLetterBoxSize,
          height: Constants.IndexLetterBoxSize,
          decoration: BoxDecoration(
            color: AppColors.IndexLetterBoxBg,
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.IndexLetterBoxRadius)),
          ),
          child: Center(
            child: Text(
              widget._currentLetter,
              style: AppStyles.IndexLetterBoxTextStyle,
            ),
          ),
        ),
      );
      _children.add(_selectLetter);
    }

    return Stack(
      children: _children,
    );
  }
}
