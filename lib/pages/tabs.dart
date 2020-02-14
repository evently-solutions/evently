import 'package:flutter/material.dart';

import 'add_event.dart';
import 'connections.dart';
import 'find_event.dart';
import 'home.dart';
import 'upcoming.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, Object>> _pages = [
    {'page': Home(), 'title': Text('EVENTLY', style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white))},
    {'page': FindEvent(), 'title': Text('Find an Event')},
    {'page': Connections(), 'title': Text('Connections')},
    {'page': AddEvent(), 'title': Text('Add an Event')},
    {'page': Upcoming(), 'title': Text('Upcoming Events')},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Find Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Connections'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Event'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Upcoming'),
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
