import 'package:evently/widgets/event_card_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          ListTile(
            title: Text('Cool'),
          )
        ],
    );
  }
}
