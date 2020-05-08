/***************************************
    Developed by Gunarathna PMSSB IT1618800
 ****************************************/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapplication/FireStoreService.dart';
import 'package:newsapplication/NewsDetails.dart';
import 'dart:ui';
import 'News.dart';
import 'WelcomPage.dart';
import 'ListPage.dart';
import 'AddNews.dart';
import 'package:carousel_pro/carousel_pro.dart';

//code for this page was inspired by following tutorial
//https://www.youtube.com/watch?v=BOztHbCIn0M&t=1034s

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("CAPPIC NEWS"),
        backgroundColor: Color(0xfff4d2800),
        leading: new Container(),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown,
      body: new Container(
          child: new Container(
              child: StreamBuilder(
        stream: FireStoreService().getNews(), //get news from firestore
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                News news = snapshot.data[index];
                return Container(
                  height: 300,
                  padding: EdgeInsets.all(6.0),
                  child: Card(
                      shadowColor: Colors.brown,
                      color: Colors.black,
                      child: Wrap(
                        children: [
                          Image(
                            image: AssetImage(news.newsImagePath),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                          ListTile(
                            title: Text(news.newsTitle,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25)),
                            subtitle: Text(news.newsDescription,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => NewsDetails(
                                      news:
                                          news), //pass news object to next page
                                )),
                          ),
                        ],
                      )),
                );
              });
        },
      ))),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            WelcomePage()), //back to welcome page
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
                    MaterialPageRoute(
                        builder: (context) => AddNews()), //to add news page
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
                    MaterialPageRoute(
                        builder: (context) => ListPage()), // to share page
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
