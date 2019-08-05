import 'package:flutter/material.dart';
import 'package:flutter_share_pic/src/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MainPage(),
    );
  }
}
