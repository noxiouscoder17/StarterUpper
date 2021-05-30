import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_upper/signin_signup.dart';

void main() {
  runApp(StarterUpper());
}

class StarterUpper extends StatefulWidget {
  @override
  _StarterUpperState createState() => _StarterUpperState();
}

class _StarterUpperState extends State<StarterUpper> {
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SigninPage.id,
      routes: {
        SigninPage.id: (context) => SigninPage(),
      },
      //Navigator.pushNamed(context, RegisterPage.id); to navigate through pages
    );
  }
}
