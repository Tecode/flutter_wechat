import 'package:flutter/material.dart';
import './home/home_screen.dart';
import './colors.dart' show AppColors;

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData(
    primaryColor: Color(AppColors.AppBarColor),
  ),
  home: HomeScreen(),
));

