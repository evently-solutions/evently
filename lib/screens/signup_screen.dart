import 'dart:convert';
import 'dart:async';

import 'package:evently/models/http_exception.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evently/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUp';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final credentials = {
    'email': '',
    'password': '',
    'firstName': '',
    'lastName': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Container(
            height: 450,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.none,
                        onChanged: (value) {
                          setState(() {
                            credentials['email'] = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            credentials['password'] = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            credentials['firstName'] = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "First Name",
                            hintText: "First Name",
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            credentials['lastName'] = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            hintText: "Last Name",
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: RaisedButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Theme.of(context).textTheme.button.color,
                              fontFamily: 'Montserrat',
                              fontSize: 16),
                        ),
                        onPressed: () async {
                          try {
                            signup().then((success) {
                              print(success);
                              if (success) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    TabsScreen.routeName, (r) => false);
                              }
                            });
                          } catch (error) {
                            print(error);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(22.0)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> signup() async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCuP2GMmaPYl9uz9Zt6PAr5564-Nw3_KEI';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': credentials['email'],
            'password': credentials['password'],
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      bool success = responseData['error'] != null;
//      if (responseData['error'] != null) {
//        throw HttpException(responseData['error']['message']);
//      }
      print(success);
      return success;
    } catch (error) {
      throw error;
    }
  }
}
