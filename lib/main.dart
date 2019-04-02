import 'package:flutter/material.dart';
import './home/home_screen.dart';
import './constants.dart' show AppColors;

void main() => runApp(
      MaterialApp(
        title: 'wechat demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
        ),
        home: HomeScreen(),
      ),
    );
