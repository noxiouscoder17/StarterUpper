import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:starter_upper/Personalization/appcolors.dart';

class SigninPage extends StatefulWidget {
  static const String id = 'signinPage';
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  Form currentForm;
  bool loginFlag = false;
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors().lightLavender,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image(
                  image: AssetImage('images/logoshort.jpeg'),
                  width: 100.0,
                  height: 100.0,
                ),
                Text(
                  'STARTER UPPER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: MyColors().darkLavender),
                ),
                Text(
                  'Made by IKAYI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ShadowsIntoLight',
                      color: MyColors().darkLavender),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          loginFlag = true;
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(147.5, 40),
                          primary: MyColors().darkLavender,
                          onPrimary: MyColors().lightLavender),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          loginFlag = false;
                        });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(147.5, 40),
                          primary: MyColors().darkLavender,
                          onPrimary: MyColors().lightLavender),
                    )
                  ],
                ),
                Center(
                  child: currentForm = getForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form getForm() {
    if (loginFlag == true) {
      return Form(
        key: _formKey,
        child: Align(
          heightFactor: 1.3,
          alignment: Alignment.center,
          child: Container(
            width: 310,
            height: 285,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  onSaved: (emailValue) {
                    _email = emailValue;
                  },
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 90, 115, 156),
                      ),
                    ),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (passwordValue) {
                    _password = passwordValue;
                  },
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 90, 115, 156),
                      ),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget password',
                      style: TextStyle(
                          fontSize: 14, color: MyColors().darkLavender),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(100, 14),
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    print(_email);
                    print(_password);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(300, 50),
                      primary: MyColors().darkLavender,
                      onPrimary: MyColors().lightLavender),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(300, 50),
                      primary: MyColors().darkLavender,
                      onPrimary: MyColors().lightLavender),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Form(
        key: _formKey,
        child: Align(
          heightFactor: 1.3,
          alignment: Alignment.center,
          child: Container(
            width: 310,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  onSaved: (emailValue) {
                    _email = emailValue;
                  },
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 90, 115, 156),
                      ),
                    ),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                TextFormField(
                  onSaved: (passwordValue) {
                    _password = passwordValue;
                  },
                  obscureText: true,
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 90, 115, 156),
                      ),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                TextFormField(
                  onSaved: (cpassValue) {
                    _confirmPassword = cpassValue;
                  },
                  obscureText: true,
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 90, 115, 156),
                      ),
                    ),
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    print(_email);
                    print(_password);
                    print(_confirmPassword);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(300, 50),
                      primary: MyColors().darkLavender,
                      onPrimary: MyColors().lightLavender),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
