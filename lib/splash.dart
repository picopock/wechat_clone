import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      print('3s 后跳转到首页');
      Navigator.of(context).pushReplacementNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/loading.jpg'),
    );
  }
}
