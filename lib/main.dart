import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_upper/login.dart';
import 'package:starter_upper/register.dart';

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
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
      },
    );
  }
}
