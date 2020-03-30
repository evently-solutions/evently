import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,),
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/logos/evently-e.png',
                  height: 300,
                ),
              ),
              Text(
                'Find your next event.',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.button.color),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(22.0)
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SignUpScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
