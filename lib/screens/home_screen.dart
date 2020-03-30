import 'package:evently/widgets/event_card.dart';
import 'package:evently/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Header('My Connections'),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 50,
            width: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (ctx, i) => Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/samples/profile_picture.jpg'),
                      radius: 20,
                    ),
                  ],
                )
            ),
          ),
          Divider(),
          Header('Recommended For You'),
          EventCard(
            imageUrl:
                'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
            title: 'Marc Anthony',
            date: DateFormat.yMMMd()
                .format(DateTime.parse('2020-03-22 19:00:00')),
            venueName: 'test',
          ),
          Divider(),
          Header('Recent Searches'),
          EventCard(
            imageUrl:
                'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
            title: 'Marc Anthony',
            date: DateFormat.yMMMd()
                .format(DateTime.parse('2020-03-22 19:00:00')),
            venueName: 'test',
          ),
          Divider(),

          Divider(),
          Header('Similar to...'),
        ],
      ),
    );
  }
}
