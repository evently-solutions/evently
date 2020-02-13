import 'package:evently/pages/find_event.dart';
import 'package:evently/pages/home.dart';
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
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: FindEvent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Find Events')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Connections')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add Event')),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Upcoming')),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: true,
        currentIndex: widget._selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
