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
              stream: FireStoreService().getNews(),
              builder:(BuildContext context,AsyncSnapshot<List<News>> snapshot){
                if(snapshot.hasError || !snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                    News news =snapshot.data[index];
                    return Container(
                      height:300,
                      padding:EdgeInsets.all(6.0),
                      child: Card(
                        shadowColor: Colors.brown,
                        color: Colors.black,
                        child:Wrap(
                          children: [
                            Image(
                              image: AssetImage(news.newsImagePath),
                              width:double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                             ListTile(
                              title: Text(news.newsTitle,
                                textAlign: TextAlign.center,
                                style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
                              ),
                              subtitle: Text(news.newsDescription,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
                             ),
                               onTap: ()=>Navigator.push(context, MaterialPageRoute(
                                 builder: (_)=>NewsDetails(news:news),
                               )
                               ),
                            ),
                          ],
                        )
                      ),
                    );
                    return Card(
                      shadowColor: Colors.brown,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage(news.newsImagePath),
                        ),
                        title: Text(news.newsTitle),
                        subtitle: Text(news.newsDescription),
                      ),
                    );
                    });
              },
            )
        )
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


