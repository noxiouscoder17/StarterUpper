import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:starter_upper/Personalization/appcolors.dart';
import 'package:starter_upper/Screens/homepage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  final _auth = FirebaseAuth.instance;

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
                ), //Login Register Page Toggle
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
                    _validateSignIn(_email, _password);
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
    } /* Sign In Page form*/ else {
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
                  onPressed: () async {
                    _formKey.currentState.save();
                    await _validateRegistration(
                        _email, _password, _confirmPassword);
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
      ); //RegistrationPage Form
    }
  }

  void _validateRegistration(email, password, cpassword) {
    setState(() async {
      if (password == cpassword) {
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          if (newUser != null) {
            User user = FirebaseAuth.instance.currentUser;
            user.sendEmailVerification();
            if (user.emailVerified) {
              Navigator.pushNamed(context, HomePage.id);
            } else {
              Alert(
                  context: context,
                  title: 'Need Verification',
                  desc: 'Check your email to verify your email id',
                  buttons: [
                    DialogButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: MyColors().darkLavender,
                    ),
                  ]).show();
            }
          }
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
      } else {
        Alert(
            context: context,
            title: 'Registration Error',
            desc: 'Password and Confirm Password do not match',
            buttons: [
              DialogButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: MyColors().darkLavender,
              ),
            ]).show();
      }
    });
  }

  void _validateSignIn(String email, String password) {
    setState(() async {
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          User user = FirebaseAuth.instance.currentUser;
          if (user.emailVerified) {
            Navigator.pushNamed(context, HomePage.id);
          } else {
            Alert(
                context: context,
                title: 'Need Verification',
                desc: 'Check your email to verify your email id',
                buttons: [
                  DialogButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: MyColors().darkLavender,
                  ),
                ]).show();
          }
        }
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
