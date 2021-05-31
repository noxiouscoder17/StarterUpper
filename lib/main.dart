import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_upper/Screens/signin_signup.dart';
import 'package:starter_upper/Screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        HomePage.id: (context) => HomePage(),
      },
      //Navigator.pushNamed(context, RegisterPage.id); to navigate through pages
    );
  }
}
