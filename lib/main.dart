import 'package:evently/screens/add_event_screen.dart';
import 'package:evently/screens/connections_screen.dart';
import 'package:evently/screens/event_details_screen.dart';
import 'package:evently/screens/find_event_screen.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/onboarding_screen.dart';
import 'package:evently/screens/profile_screen.dart';
import 'package:evently/screens/signup_screen.dart';
import 'package:evently/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(18, 144, 203, 1.0),
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          color: Color.fromRGBO(18, 144, 203, 1.0),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            button: TextStyle(
              color: Colors.white,
            ),
            headline: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            title: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white)),
        buttonTheme: ButtonThemeData(
          height: 50,
          buttonColor: Color.fromRGBO(18, 144, 203, 1.0),
        )
      ),
      home: OnboardingScreen(),
      routes: {
        OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        FindEventScreen.routeName: (ctx) => FindEventScreen(),
        EventDetailsScreen.routeName: (ctx) => EventDetailsScreen(),
        ConnectionsScreen.routeName: (ctx) => ConnectionsScreen(),
        AddEventScreen.routeName: (ctx) => AddEventScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
      },
    );
  }
}
