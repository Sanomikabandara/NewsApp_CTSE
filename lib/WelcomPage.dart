import 'package:flutter/material.dart';
import 'dart:ui';
import 'LoginPage.dart';
import 'SignupPage.dart';

//Code for this was inspired by following tutorial
//https://www.youtube.com/watch?v=u_Lyx8KJWpg&t=1s

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/welcome.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //SizedBox(height: 10.0,),
                imageText(),
                Text(
                  'Create Your Own News',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                Divider(
                  color: Colors.white70,
                  indent: 85.0,
                  endIndent: 85.0,
                  height: 20.0,
                ),
                SizedBox(
                  height: 80.0,
                ),
                widgetSignup1ButtonContainer(),
                SizedBox(
                  height: 5.0,
                ),

                Column(children: <Widget>[
                  Row(
                    children: <Widget>[],
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.white70,
                            height: 36,
                          )),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.white70,
                            height: 36,
                          )),
                    ),
                  ]),
                  Row(
                    children: <Widget>[],
                  ),
                ]),

                SizedBox(
                  height: 5.0,
                ),
                widgetLoginButtonContainer(),
              ]),
        ),
      ),
    );
  }

  widgetLoginButtonContainer() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(28)),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  widgetSignup1ButtonContainer() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage()));
      },
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(28)),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: Center(
          child: Text(
            "Signup",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget imageText() {
    return Container(
      child: Image(
        image: AssetImage("images/l1.png"),
        height: 155.0,
      ),
    );
  }
}
