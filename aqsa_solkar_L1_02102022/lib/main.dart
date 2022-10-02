import 'package:aqsa_solkar_l1_02102022/res/app_theme.dart';
import 'package:aqsa_solkar_l1_02102022/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

