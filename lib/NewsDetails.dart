import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'News.dart';
class NewsDetails extends StatelessWidget {
final News news;
const NewsDetails({Key key, @required this.news}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CAPPIC NEWS"),
        backgroundColor: Color(0xfff4d2800),
        leading: new Container(),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: AssetImage(news.newsImagePath),
            fit: BoxFit.cover,
            height: 300,
          ),
          title(),
          SizedBox(
            height: 80.0,
          ),
          addUpdateButtons()
        ],
      ),
    );
  }

  Widget title() {
    return Container(
        child: new Column(
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.newsTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.newsDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
    );
  }

  Widget update() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffb71c1c), Color(0xffbf360c)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 10.0),
            alignment: Alignment.center,
            child: Text(
              "UPDATE",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget delete() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffb71c1c), Color(0xffbf360c)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 10.0),
            alignment: Alignment.center,
            child: Text(
              "DELETE",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget addUpdateButtons() {
    return Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: update()
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: delete()
            )
          ],
        )
    );
  }
}