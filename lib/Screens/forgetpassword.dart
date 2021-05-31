import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:starter_upper/Personalization/appcolors.dart';
import 'package:starter_upper/Screens/signin_signup.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String id = 'forgotPasswordPage';
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _email = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors().lightLavender,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image(
                  image: AssetImage('images/logoshort.jpeg'),
                  width: 100.0,
                  height: 100.0,
                ), //Logo
                Text(
                  'STARTER UPPER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: MyColors().darkLavender),
                ), //ProductName
                Text(
                  'Made by IKAYI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ShadowsIntoLight',
                      color: MyColors().darkLavender),
                ), //Company Name
                SizedBox(
                  height: 40,
                ),
                Text(
                  'FORGOT PASSWORD',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MyColors().darkLavender),
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 310,
                        child: TextFormField(
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
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Text(
                              'Cancel',
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
                            onPressed: () async {
                              _formKey.currentState.save();
                              await _validateResetEmail();
                            },
                            child: Text(
                              'Send Reset Link',
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
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateResetEmail() {
    setState(() async {
      try {
        await _auth.sendPasswordResetEmail(email: _email);
        Alert(
            context: context,
            title: "Email Sent",
            desc: "Password reset link sent to the email",
            buttons: [
              DialogButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                color: MyColors().darkLavender,
              )
            ]).show();
      } catch (e) {
        Alert(context: context, title: e.code, desc: e.message, buttons: [
          DialogButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
            color: MyColors().darkLavender,
          )
        ]).show();
        print('Error Code: ${e.code}');
      }
    });
  }
}
