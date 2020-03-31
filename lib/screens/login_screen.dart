import 'dart:convert';
import 'dart:async';

import 'package:evently/models/http_exception.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:evently/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = {
    'email': '',
    'password': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Container(
            height: 300,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
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
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(fontFamily: 'Montserrat',),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(22.0)))),
                        onChanged: (value) {
                          setState(() {
                            auth['email'] = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(fontFamily: 'Montserrat',),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(22.0)))),
                        onChanged: (value) {
                          setState(() {
                            auth['password'] = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: RaisedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                              color: Theme.of(context).textTheme.button.color,
                              fontFamily: 'Montserrat',),
                        ),
                        onPressed: () async {
                          bool authenticated = await login();
                          if(!authenticated) {
                            Navigator.pushNamedAndRemoveUntil(context, TabsScreen.routeName, (r) => false);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(22.0)
                        ),
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

  Future<bool> login() async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCuP2GMmaPYl9uz9Zt6PAr5564-Nw3_KEI';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': auth['email'],
            'password': auth['password'],
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      bool error = responseData['error'] != null;
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(error);
      return error;
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!', style: TextStyle(fontFamily: 'Montserrat',),),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay', style: TextStyle(fontFamily: 'Montserrat',),),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
