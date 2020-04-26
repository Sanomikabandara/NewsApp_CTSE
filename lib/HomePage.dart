import 'package:flutter/material.dart';
import 'dart:ui';
import 'WelcomPage.dart';
import 'ListPage.dart';
import 'AddNews.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.red,
      body: new Container(
        child: imageCarasoul(),
        //Adding picture code goes here
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Color(0xfff4d2800),
        child: new Container(

          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.undo),
                iconSize: 35.0,
                color: Colors.white70,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                },
              ),

              new IconButton(
                icon: new Icon(Icons.add),
                iconSize: 40.0,
                color: Colors.white70,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNews()),
                  );
                },
              ),

              new IconButton(
                icon: new Icon(Icons.call_split),
                iconSize: 35.0,
                color: Colors.white70,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageCarasoul(){
    return Container(
      height: 250.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/news_red.jpg'),
          AssetImage('images/news_blue.jpg')
        ],
      ),
    );
  }
}


