import 'package:flutter/material.dart';

import './loading.dart';
import './home/home_screen.dart';

import './constants.dart' show AppColors;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'wechat demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor),
        ),
        routes: <String, WidgetBuilder>{
          'app': (BuildContext context) => HomeScreen(),
        },
        home: LoadingPage(),
      ),
    );
