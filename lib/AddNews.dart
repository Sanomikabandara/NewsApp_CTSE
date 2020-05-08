/***************************************
 Developed by Gunarathna PMSSB IT1618800
 ****************************************/

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newsapplication/FireStoreService.dart';
import 'package:newsapplication/News.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Code for this page was inspired by following tutorials
//https://www.youtube.com/watch?v=-blxq_RLybQ&t=928s
//https://www.youtube.com/watch?v=7uqmY6le4xk

class AddNews extends StatelessWidget {
  static const String _title = 'ADD NEW NEWS';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.brown,
        ),
        body: Builder(
          builder: (context) => Container(
            child: NewsForm(),
          ),
        ),
      ),
    );
  }
}

class NewsForm extends StatefulWidget {
  NewsForm({Key key}) : super(key: key);

  @override
  _NewsFormWidgetState createState() => _NewsFormWidgetState();
}

class _NewsFormWidgetState extends State<NewsForm> {
  File _image;
  final _formKey = GlobalKey<ScaffoldState>();

//select image from gallery
  Future selectImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

//create controller for text fields and image path
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController descriptionCtrl = new TextEditingController();
  TextEditingController imagepathCtrl = new TextEditingController();
  TextEditingController userIdCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backgoundform.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 1.0,
                ),
                imageText(),
                SizedBox(
                  height: 0.0,
                ),
                userId(),
                SizedBox(
                  height: 1.0,
                ),
                newsTitle(),
                SizedBox(
                  height: 1.0,
                ),
                description(),
                SizedBox(
                  height: 1.0,
                ),
                imageAdd(),
                SizedBox(
                  height: 1.0,
                ),
                addnews(),
              ]),
        ),
      ),
    );
  }

  Widget newsTitle() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: titleCtrl,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'News Title',
            prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.transparent,
          ),
        ));
  }

  //news description text field
  Widget description() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: descriptionCtrl,
          autocorrect: true,
          maxLines: 5,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Description',
            focusColor: Colors.white70,
            hoverColor: Colors.white,
            alignLabelWithHint: true,
            prefixIcon: Icon(
              Icons.add_comment,
              color: Colors.black,
            ),
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),
        ));
  }

  //user id text feild
  Widget userId() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: userIdCtrl,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'User Id',
            focusColor: Colors.white70,
            hoverColor: Colors.white,
            prefixIcon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),
        ));
  }

//add news button
  Widget addnews() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          addNews();
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
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 10.0),
            alignment: Alignment.center,
            child: Text(
              "ADD NEWS",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  //image picker
  Widget imageAdd() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xff795548),
              child: ClipOval(
                child: new SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: (_image != null)
                      ? Image.file(
                          _image,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          "https://images.unsplash.com/photo-1534583000938-a375b825ea16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: IconButton(
              icon: Icon(
                Icons.camera,
                size: 30.0,
              ),
              onPressed: () {
                selectImageFromGallery();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget imageText() {
    return Container(
      child: Image(
        image: AssetImage("images/l2.png"),
        height: 100.0,
      ),
    );
  }

  //add news to database
  Future<bool> addNews() async {
    try {
      //validating empty fields
      if (userIdCtrl.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
            content: new Text("Your user Id is empty,Enter your user Id!"),
            backgroundColor: Colors.deepOrange);
        _formKey.currentState.showSnackBar(snackBar);
      } else if (titleCtrl.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
            content: new Text("News title is empty,Enter news title!"),
            backgroundColor: Colors.deepOrange);
        _formKey.currentState.showSnackBar(snackBar);
      } else if (descriptionCtrl.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
            content:
                new Text("News description is empty,Enter news description!"),
            backgroundColor: Colors.deepOrange);
        _formKey.currentState.showSnackBar(snackBar);
      } else {
        News new_news = News(
            newsTitle: titleCtrl.text.trim(),
            newsDescription: descriptionCtrl.text.trim(),
            newsImagePath: "images/news4.jpg");
        //invoke add news method
        await FireStoreService().addNews(new_news);

        //clear text fields
        setState(() {
          titleCtrl.clear();
          descriptionCtrl.clear();
          userIdCtrl.clear();
        });

        Fluttertoast.showToast(
            msg: "Your news has sucessfully added!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0);
      }
    } catch (e) {
      SnackBar snackBar = new SnackBar(
          content: new Text("Something went wrong! Please try again!"),
          backgroundColor: Colors.deepOrange);

      _formKey.currentState.showSnackBar(snackBar);
      print(e.message);
    }
  }
}
