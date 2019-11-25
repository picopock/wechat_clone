import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './widgets/grid_view_list.dart' show OperateType, CustomGridViewList;

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
  WebViewController controller;

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

  onTap(OperateType key) {
    String loadUrl;
    switch (key) {
      case OperateType.HOME:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.CATEGORY:
        loadUrl = 'https://so.m.jd.com/webportal/channel/m_category/';
        break;
      case OperateType.SHOPPING:
        loadUrl = 'https://p.m.jd.com/cart/cart.action/';
        break;
      case OperateType.PERSONAL:
        loadUrl = 'https://plogin.m.jd.com/user/';
        break;
      case OperateType.PLUS:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.FLOAT_WINDOW:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SEND_FRIEND:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SHARE_FRIENDS:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.COLLECT:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SEARCH:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.COPY_URL:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.OPEN_IN_BROWSER:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.TRANSLATE:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.MODIFY_FONT:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.REFRESH:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.COMPLAINT:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SHARE_ENTERPRISE_WECHAT:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SHARE_QQ:
        loadUrl = 'https://m.jd.com/';
        break;
      case OperateType.SHARE_QQ_ZORE:
        loadUrl = 'https://m.jd.com/';
        break;
      default:
        loadUrl = 'https://m.jd.com/';
    }
    controller.loadUrl(loadUrl).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('render');
    print(controller);
    return Scaffold(
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
                  return Container(
                    height: 400.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                style: BorderStyle.solid,
                                color: Color(0xffc3c3c3),
                              ),
                            ),
                          ),
                          child: Text(
                            '网页由 wq.jd.com 提供',
                            style: TextStyle(
                              color: Color(0xffc3c3c3),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        CustomGridViewList(onTap: onTap),
                      ],
                    ),
                  );
                },
              );
            },
            color: Colors.white,
            icon: Icon(Icons.dashboard),
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'https://m.jd.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController _controller) {
          setState(() {
            controller = _controller;
          });
        },
        onPageFinished: (String url) {
          print('url: $url');
        },
      ),
    );
  }
}
