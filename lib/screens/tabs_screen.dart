import 'package:evently/screens/add_event_screen.dart';
import 'package:evently/screens/connections_screen.dart';
import 'package:evently/screens/find_event_screen.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _screens = [
      {
        'screen': HomeScreen(),
        'title': '',
      },
      {
        'screen': FindEventScreen(),
        'title': 'Find an Event',
      },
      {
        'screen': ConnectionsScreen(),
        'title': 'My Community',
      },
      {
        'screen': AddEventScreen(),
        'title': 'Checkin',
      },
      {
        'screen': ProfileScreen(),
        'title': 'My Profile',
      },
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'], style: TextStyle(fontFamily: 'Montserrat'),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Connect'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Checkin'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
