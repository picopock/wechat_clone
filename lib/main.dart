import 'package:flutter/material.dart';

import './splash.dart';
import './pages/home_page.dart';
import './pages/search/search.dart';

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
          'home': (BuildContext context) => HomePage(),
          'search': (BuildContext context) => Search(),
        },
        home: SplashPage(),
      ),
    );
