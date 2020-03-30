import 'package:evently/widgets/timeline.dart';
import 'package:flutter/material.dart';

class ConnectionsScreen extends StatelessWidget {
  static const routeName = '/connections';

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Container(
      child: Timeline(
        children: <Widget>[
          Container(height: 100, color: color, child: Center(child: Text('Sample post', style: TextStyle(color: Colors.white),),),),
          Container(height: 50, color: color, child: Center(child: Text('Sample event', style: TextStyle(color: Colors.white),),),),
          Container(height: 200, color: color, child: Center(child: Text('Sample comment', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample group post', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample post', style: TextStyle(color: Colors.white),),),),
          Container(height: 50, color: color, child: Center(child: Text('Sample event', style: TextStyle(color: Colors.white),),),),
          Container(height: 200, color: color, child: Center(child: Text('Sample comment', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample group post', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample post', style: TextStyle(color: Colors.white),),),),
          Container(height: 50, color: color, child: Center(child: Text('Sample event', style: TextStyle(color: Colors.white),),),),
          Container(height: 200, color: color, child: Center(child: Text('Sample comment', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample group post', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample post', style: TextStyle(color: Colors.white),),),),
          Container(height: 50, color: color, child: Center(child: Text('Sample event', style: TextStyle(color: Colors.white),),),),
          Container(height: 200, color: color, child: Center(child: Text('Sample comment', style: TextStyle(color: Colors.white),),),),
          Container(height: 100, color: color, child: Center(child: Text('Sample group post', style: TextStyle(color: Colors.white),),),),
        ],
        indicators: <Widget>[
          Icon(Icons.person),
          Icon(Icons.calendar_today),
          Icon(Icons.note),
          Icon(Icons.people),
          Icon(Icons.person),
          Icon(Icons.calendar_today),
          Icon(Icons.note),
          Icon(Icons.people),
          Icon(Icons.person),
          Icon(Icons.calendar_today),
          Icon(Icons.note),
          Icon(Icons.people),
          Icon(Icons.person),
          Icon(Icons.calendar_today),
          Icon(Icons.note),
          Icon(Icons.people),
        ],
      ),
    );
  }
}
