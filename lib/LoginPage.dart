import 'package:flutter/material.dart';
import 'dart:ui';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/logsig.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                imageText(),
                SizedBox(height: 30.0,),
                facebookButton(),
                SizedBox(height: 20.0,),
                emailField(),
                SizedBox(height: 5.0,),
                passwordWidget(),
                SizedBox(height: 20.0,),
                Text(
                  "DON'T HAVE AN ACCOUNT? SIGNUP",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30.0,),
                signin(),
              ]
          ),
        ),
      ),
    );
  }


  Widget passwordWidget() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.black
            ),
            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.transparent,
          ),)
    );
  }

  Widget emailField() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Email',
            focusColor: Colors.white70,
            hoverColor: Colors.white,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),)
    );
  }

  Widget facebookButton() {
    return Container(
        width: 300,
        height: 45.0,
        child:RaisedButton.icon(
          icon: Image.asset('images/fblogo.png' ,width: 30,height: 30,),
          onPressed: () {

          },
          color: Color(0xfff3D69B5),
          textColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))) ,

          label: Text('Login With Facebook',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,

            ),
          ),
        )
    );
  }

  gotoSecondActivity(BuildContext context){

  }

  Widget signin() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => HomePage()
          ));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xfff4d1300), Color(0xffff9900)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageText() {
    return Container(
      child: Image(
        image: AssetImage("images/l2.png"),
        height: 170.0,
      ),
    );
  }

}