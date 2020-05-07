
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapplication/FireStoreService.dart';
import 'package:newsapplication/HomePage.dart';
import 'package:newsapplication/UpdateNews.dart';

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
          addUpdateButtons(context)
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

  Widget update(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (_)=>UpdateNews(news:news),
          ));
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

  Widget delete(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          deleteNews(news.id, context);
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

  Widget addUpdateButtons(BuildContext context) {
    return Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: update(context)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: delete(context)
            )
          ],
        )
    );
  }

  void deleteNews(String id,BuildContext context) async{
    if(await _showConfirmationDialog(context)){
      try{
        await FireStoreService().deleteNews(id);
        Fluttertoast.showToast(
            msg: "You have deleted news sucessfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      }
      catch(e){
        Fluttertoast.showToast(
            msg: "Something went wrong! Please try again later!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
      }
    }
  }

Future<bool> _showConfirmationDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: Text("Are you sure you want to delete?"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.red,
            child: Text("Delete"),
            onPressed: () => Navigator.pop(context,true),
          ),
          FlatButton(
            textColor: Colors.black,
            child: Text("No"),
            onPressed: () => Navigator.pop(context,false),
          ),
        ],
      )
  );
}
}