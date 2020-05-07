import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapplication/FireStoreService.dart';
import 'package:newsapplication/HomePage.dart';
import 'package:newsapplication/NewsDetails.dart';
import 'News.dart';

//Code for this page was inspired by following tutorials
//https://www.youtube.com/watch?v=-blxq_RLybQ&t=928s

class UpdateNews extends StatefulWidget {
  final News news;

  const UpdateNews({Key key, @required this.news}) : super(key: key);

  @override
  _UpdateNewsState createState() => _UpdateNewsState();
}

class _UpdateNewsState extends State<UpdateNews> {
  final _formKey = GlobalKey<ScaffoldState>();
  TextEditingController titleCtrl;
  TextEditingController descCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.news.newsTitle);
    descCtrl = TextEditingController(text: widget.news.newsDescription);
  }

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
            image: AssetImage(widget.news.newsImagePath),
            fit: BoxFit.cover,
            height: 300,
          ),
          title(),
          SizedBox(
            height: 50.0,
          ),
          addUpdateButtons(context)
        ],
      ),
    );
  }

  Widget title() {
    return Container(
        child: new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: titleCtrl,
            autocorrect: true,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Title",
              focusColor: Colors.white70,
              hoverColor: Colors.white,
              alignLabelWithHint: true,
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.black,
              ),
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              fillColor: Colors.transparent,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: descCtrl,
            autocorrect: true,
            maxLines: 5,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "description",
              focusColor: Colors.white70,
              hoverColor: Colors.white,
              alignLabelWithHint: true,
              prefixIcon: Icon(
                Icons.comment,
                color: Colors.black,
              ),
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              fillColor: Colors.transparent,
            ),
          ),
        )
      ],
    ));
  }

  Widget update(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          updateCurrentNews(context);
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

  Widget addUpdateButtons(BuildContext context) {
    return Container(
        child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(16.0), child: update(context)),
      ],
    ));
  }

  void updateCurrentNews(BuildContext context) async {
    if (await _showConfirmationDialog(context)) {
      try {
        News updatingNews = News(
            id: widget.news.id,
            newsTitle: titleCtrl.text.trim(),
            newsDescription: descCtrl.text.trim(),
            newsImagePath: widget.news.newsImagePath);
        await FireStoreService().updateNews(updatingNews);
        Fluttertoast.showToast(
            msg: "You have updated news sucessfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0);
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        Fluttertoast.showToast(
            msg: "Something went wrong! Please try again later!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to update?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Update"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
