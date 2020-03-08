import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              CircleAvatar(
                backgroundImage: AssetImage('assets/samples/profile_picture.jpg'),
                radius: 75,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Brian Tardif',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phoenix, Arizona',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Divider(
            height: 40,
          ),
          Text(
            'Events',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
              ],
            ),
          ),
          Divider(
            height: 40,
          ),
          Text(
            'Favorites',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Test'),
                  trailing: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
