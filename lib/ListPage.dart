import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';


//URLs used to link to social medias on button clicks
const url1 = "https://www.youtube.com/channel/UC1rINdMFZJRe6FYY2l0xbrg";
const url2 = "https://www.facebook.com/sliit.lk/";
const url3 = "https://twitter.com/sliitinfo?lang=en";

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  //function to launch feedback email on button click
  void launchEmail(String emailID) async{
    var url = "mailto: $emailID?subject= CAPPIC Feedback Email";
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

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
          SizedBox(height: 11.0,),
          feedbackButton(),
          SizedBox(height: 11.0,),
          moreButton(),
          SizedBox(height: 11.0,),
          socialMediaButton(),
          SizedBox(height: 11.0,),
          locationButton(),
        ],
      ),
    );
  }

  Widget feedbackButton() {
    //Feedback email
    return Container(
        width: 200,
        height: 70.0,
        child:RaisedButton.icon(
          icon: Icon(
            Icons.feedback,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            //default email recipient address
            launchEmail('support@cappic.com');
          },
          color: Colors.transparent,
          textColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(120.0)), side: BorderSide(color: Colors.black)),

          label: Text('Send Feedback Email',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
    );
  }

  Widget moreButton() {
    //More information about us
    return Container(
        width: 200,
        height: 70.0,
        child:RaisedButton.icon(
          icon: Icon(
            Icons.more,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            showDialog(context: context, builder: (context) => CustomDialog2(
              title: "About us",
              description: "We provide professional photography for architectural & interior projects, bespoke 360° virtual tours & panoramic photography including Google Street View & Facebook 360°. We also have travel stock imagery of various cities around the world for immediate purchase and download.                                                   "
                  "We also do wedding photography and videography",
            ));
          },
          color: Colors.transparent,
          textColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(120.0)), side: BorderSide(color: Colors.black)),

          label: Text('More About Us',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
    );
  }

  Widget socialMediaButton() {
    //more social media links are available in the dialog box once clicked
    return Container(
        width: 200,
        height: 70.0,
        child:RaisedButton.icon(
          icon: Icon(
            Icons.people,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            showDialog(context: context, builder: (context) => CustomDialog3(
                title: "Find Us On",
                description: "Find out more about CAPPIC and also about our works and promotional activities in popular social medias."
            ));
          },
          color: Colors.transparent,
          textColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(120.0)), side: BorderSide(color: Colors.black)),

          label: Text('Social Media Pages',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
    );
  }

  Widget locationButton() {
    //location information are provided once clicked
    return Container(
        width: 200,
        height: 70.0,
        child:RaisedButton.icon(
          icon: Icon(
            Icons.location_on,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            showDialog(context: context, builder: (context) => CustomDialog1(
              title: "Our Location",
              description: "We are located at the heart of colombo near the havlock coffee bean on the roof top with a beautiful view.                                                         "
                  "Address: No. 101 Havelock Rd, Colombo 00500                                                                 "
                  "Hours: Open ⋅ Closes 6PM                                                                                                         "
                  "Phone: 0112 588 5577",
            ));
          },
          color: Colors.transparent,
          textColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(120.0)), side: BorderSide(color: Colors.black)),

          label: Text('Contact Us',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
    );
  }
}

class CustomDialog1 extends StatelessWidget {
  //custom made dialog box to display the location information
  final String title, description, buttonText;
  final Image image;

  CustomDialog1({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 22.0),
              Text(description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            backgroundImage: AssetImage('images/location7.gif'),
          ),
        ),
      ],
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  //custom made dialog box to display more about us information
  final String title, description, buttonText;
  final Image image;

  CustomDialog2({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 22.0),
              Text(description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 80,
          right: 80,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 60,
            backgroundImage: AssetImage('images/camera.gif'),
          ),
        ),
      ],
    );
  }
}

class CustomDialog3 extends StatelessWidget {
  //custom made dialog box to display the button links to social media
  final String title, description, buttonText;
  final Image image;

  Future launchUrl(String url) async{
    if(await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    }
  }

  CustomDialog3({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 22.0),
              Text(description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              Align(
                //find more about us on youtube button
                alignment: Alignment.center,
                child:RaisedButton.icon(
                  icon: Image.asset('images/youtube.jpg' ,width: 30,height: 30,),
                  onPressed: () {
                    launchUrl(url1);
                  },
                  color: Color(0xffff5f5f0),
                  textColor: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))) ,

                  label: Text('Find us on Youtube',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
              Align(
                // find more about us on facebook button
                alignment: Alignment.center,
                child:RaisedButton.icon(
                  icon: Image.asset('images/fblogo.png' ,width: 30,height: 30,),
                  onPressed: () {
                    launchUrl(url2);
                  },
                  color: Color(0xfff3D69B5),
                  textColor: Colors.white,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))) ,

                  label: Text('Find us on Facebook',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
              Align(
                //find more about us on twitter button
                alignment: Alignment.center,
                child:RaisedButton.icon(
                  icon: Image.asset('images/tw2.png' ,width: 30,height: 30,),
                  onPressed: () {
                    launchUrl(url3);
                  },
                  color: Color(0xfff4ddbff),
                  textColor: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))) ,

                  label: Text('Find us on twitter',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          //circular area on top of the dialog box to display the animated images
          top: 0,
          left: 80,
          right: 80,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 60,
            backgroundImage: AssetImage('images/socialmedia.gif'),
          ),
        ),
      ],
    );
  }
}


