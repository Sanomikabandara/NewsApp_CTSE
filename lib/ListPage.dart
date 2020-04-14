import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:ui';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    Widget image_Carousel = new Container(
      height: 250.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/4.jpg'),
          AssetImage('images/2.jpg'),
          AssetImage('images/3.jpg'),
          AssetImage('images/1.jpg'),
        ],
      ),
    );
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          image_Carousel,
        ],
      ),
    );
  }
}


