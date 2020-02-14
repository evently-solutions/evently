import 'package:evently/pages/tabs.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(18, 144, 203, 1.0),
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
      ),
      home: Page(
        title: 'EVENTLY',
      ),
    );
  }
}

class Page extends StatefulWidget {
  final String title;
  int _selectedIndex = 0;

  Page({this.title});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs(),
    );
  }
}
