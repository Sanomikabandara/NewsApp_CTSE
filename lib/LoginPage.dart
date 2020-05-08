/***************************************
    Developed by Nibraz M IT16165694
 ****************************************/

import 'package:flutter/material.dart';
import 'dart:ui';
import 'HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Code for this was inspired by following tutorial
//https://www.youtube.com/watch?v=u_Lyx8KJWpg&t=1s

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          height: MediaQuery.of(context).size.height,
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
                SizedBox(
                  height: 30.0,
                ),
                facebookButton(),
                SizedBox(
                  height: 20.0,
                ),
                emailField(),
                SizedBox(
                  height: 5.0,
                ),
                passwordWidget(),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "DON'T HAVE AN ACCOUNT? SIGNUP",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                signin(),
              ]),
        ),
      ),
    );
  }

  Widget passwordWidget() {
    //text field for password
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: passwordController,
          autocorrect: true,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
            hintStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.transparent,
          ),
        ));
  }

  Widget emailField() {
    //text field for email
    return Container(
        width: 300,
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: emailController,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Email',
            focusColor: Colors.white70,
            hoverColor: Colors.white,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            hintStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),
        ));
  }

  Widget facebookButton() {
    //creating facebook login button
    return Container(
        width: 300,
        height: 45.0,
        child: RaisedButton.icon(
          icon: Image.asset(
            'images/fblogo.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {},
          color: Color(0xfff3D69B5),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          label: Text(
            'Login With Facebook',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  gotoSecondActivity(BuildContext context) {}

  Widget signin() {
    //creating signin button
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          login();
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            //providing gradient effect for the button
              gradient: LinearGradient(
                colors: [Color(0xfff4d1300), Color(0xffff9900)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageText() {
    //displaying the logo
    return Container(
      child: Image(
        image: AssetImage("images/l2.png"),
        height: 170.0,
      ),
    );
  }

  Future<bool> login() async {
    //login authentication
    try {
      if (emailController.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
          //displaying error message
            content: new Text("Your email is empty,Enter your email!"),
            backgroundColor: Colors.deepOrange);
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else if (passwordController.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
          //displaying error message
            content: new Text("Your password is empty,Enter your password"),
            backgroundColor: Colors.deepOrange);
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        AuthResult newUser = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      SnackBar snackBar = new SnackBar(
        //displaying error message
          content: new Text(
              "Your email or password is incorrect! Please try again!"),
          backgroundColor: Colors.deepOrange);

      _scaffoldKey.currentState.showSnackBar(snackBar);
      print(e.message);
    }
  }
}
