import 'package:flutter/material.dart';
import 'dart:ui';

class SignupPage extends StatelessWidget {
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
                SizedBox(height: 10.0,),
                imageText(),
                SizedBox(height: 30.0,),
                nameField(),
                SizedBox(height: 5.0,),
                emailField(),
                SizedBox(height: 5.0,),
                passwordWidget(),
                SizedBox(height: 20.0,),
                Text(
                  "ALREADY HAVE AN ACCOUNT? SIGNIN",
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

  Widget nameField() {
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Name',
            focusColor: Colors.white70,
            hoverColor: Colors.white,
            prefixIcon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),)
    );
  }

  Widget signin() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xfff4d1300), Color(0xfffff9900)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Sign Up",
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