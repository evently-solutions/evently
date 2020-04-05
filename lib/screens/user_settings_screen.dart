import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
    );
  }
}
