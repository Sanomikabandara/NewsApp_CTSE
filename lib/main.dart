import 'package:flutter/material.dart';
import 'WelcomPage.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
