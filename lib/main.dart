import 'package:flutter/material.dart';

import './splash.dart';
import './pages/home_page/home_page.dart';
import './pages/search/search.dart';
import './pages/shopping_page/shopping_page.dart';

import './constants.dart' show AppColors;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'wechat demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor),
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext ctx) => SplashPage(),
          '/home': (BuildContext context) => HomePage(),
          '/search': (BuildContext context) => Search(),
          '/shopping': (BuildContext context) => ShoppingPage(),
        },
      ),
    );
