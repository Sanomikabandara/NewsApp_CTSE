/***************************************
    Developed by Gunarathna PMSSB IT1618800
 ****************************************/

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Code for this was inspired by following tutorial
//https://www.youtube.com/watch?v=u_Lyx8KJWpg&t=1s

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
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
                SizedBox(
                  height: 10.0,
                ),
                imageText(),
                SizedBox(
                  height: 30.0,
                ),
                nameField(),
                SizedBox(
                  height: 5.0,
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
                  "ALREADY HAVE AN ACCOUNT? SIGNIN",
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

  //password text field
  Widget passwordWidget() {
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

  //email text field
  Widget emailField() {
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

  //name text field
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
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            fillColor: Colors.transparent,
          ),
        ));
  }

  //sign in button
  Widget signin() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          signUP();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xfff4d1300), Color(0xfffff9900)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  //logo
  Widget imageText() {
    return Container(
      child: Image(
        image: AssetImage("images/l2.png"),
        height: 170.0,
      ),
    );
  }

  //create user in firebase authentication using sign in method as email/password
  Future<bool> signUP() async {
    try {
      //validate fields
      if (emailController.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
            content: new Text("Your email is empty,Enter your email!"),
            backgroundColor: Colors.deepOrange);
        _scaffoldKey2.currentState.showSnackBar(snackBar);
      } else if (passwordController.text.trim().isEmpty) {
        SnackBar snackBar = new SnackBar(
            content: new Text("Your password is empty,Enter your password"),
            backgroundColor: Colors.deepOrange);
        _scaffoldKey2.currentState.showSnackBar(snackBar);
      } else {
        //create user
        AuthResult newUser = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
        Fluttertoast.showToast(
            msg:
                "Your news has sucessfully signed up, Please login to continue!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0);
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } catch (e) {
      SnackBar snackBar = new SnackBar(
          content: new Text("Something went wrong!Please try again later!"),
          backgroundColor: Colors.deepOrange);

      _scaffoldKey2.currentState.showSnackBar(snackBar);
      print(e.message);
    }
  }
}
