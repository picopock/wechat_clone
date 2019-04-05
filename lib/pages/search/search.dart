import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode focusNode = new FocusNode();

  FocusNode _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text) {
    return;
  }

  Widget _itemBuilder(String name, {bool border: true}) {
    const double itemWidth = 100.0;
    const TextStyle textStyle =
        TextStyle(fontSize: 14.0, color: Color(0xFF467290));
    return border
        ? Container(
            width: itemWidth,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Color(0xFFDDDDDD),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Text(
              name,
              style: textStyle,
            ),
          )
        : Container(
            width: itemWidth,
            alignment: Alignment.center,
            child: Text(
              name,
              style: textStyle,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18.0,
                ),
                onChanged: (String text) {
                  print(text);
                },
                decoration: InputDecoration(
                  hintText: '搜索',
                  hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.mic, color: Color(0xFFAAAAAA)),
              onPressed: () {
                print('mic pressed!');
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Text(
                '搜索指定内容',
                style: TextStyle(fontSize: 14.0, color: Color(0xFFB5B5B5)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _itemBuilder('朋友圈'),
                  _itemBuilder('文章'),
                  _itemBuilder('公众号', border: false),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _itemBuilder('小程序'),
                  _itemBuilder('音乐'),
                  _itemBuilder('表情', border: false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
