import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './widgets/grid_view_list.dart';

enum ConfirmDialogAction {
  cancel,
  discard,
  disagree,
  agree,
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showConfirmDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      barrierDismissible: false, // 用户必须点击Button
      builder: (BuildContext context) => child,
    ).then<T>((T value) {
      if (value == ConfirmDialogAction.discard) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.jd.com/',
      withJavascript: true,
      withZoom: true,
      withLocalStorage: true,
      enableAppScheme: true,
      hidden: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _showConfirmDialog<ConfirmDialogAction>(
              context: context,
              child: AlertDialog(
                content: Text('确定离开购物页面？'),
                actions: <Widget>[
                  FlatButton(
                      child: const Text('再逛逛'),
                      onPressed: () {
                        Navigator.pop(context, ConfirmDialogAction.cancel);
                      }),
                  FlatButton(
                      child: const Text('离开'),
                      onPressed: () {
                        Navigator.pop(context, ConfirmDialogAction.discard);
                      })
                ],
              ),
            );
          },
        ),
        title: Text('京东购物'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(child: CustomGridViewList());
                },
              );
            },
            color: Colors.white,
            icon: Icon(Icons.dashboard),
          ),
        ],
      ),
    );
  }
}
