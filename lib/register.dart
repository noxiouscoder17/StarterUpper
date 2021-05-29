import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 170, 181, 201),
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 50.0, right: 8.0, bottom: 8.0),
                  child: Image(
                    image: AssetImage('images/logoshort.jpeg'),
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Center(
                  child: Text(
                    'STARTER UPPER',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Made by IKAYI',
                    style: TextStyle(
                      fontFamily: 'ShadowsIntoLight',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 115, 156),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Color.fromARGB(255, 90, 115, 156),
                        onPrimary: Color.fromARGB(255, 170, 181, 201),
                        minimumSize: Size(147.5, 40),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Color.fromARGB(255, 90, 115, 156),
                        onPrimary: Color.fromARGB(255, 170, 181, 201),
                        minimumSize: Size(147.5, 40),
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, right: 40, left: 40, bottom: 0),
                        child: Container(
                          width: 300,
                          height: 65,
                          child: TextFormField(
                            autofocus: true,
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 40, left: 40, bottom: 0),
                        child: Container(
                          width: 300,
                          height: 65,
                          child: TextFormField(
                            obscureText: true,
                            autofocus: true,
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 40, left: 40, bottom: 10),
                        child: Container(
                          width: 300,
                          height: 65,
                          child: TextFormField(
                            obscureText: true,
                            autofocus: true,
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
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Color.fromARGB(255, 90, 115, 156),
                          onPrimary: Color.fromARGB(255, 170, 181, 201),
                          minimumSize: Size(300, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
