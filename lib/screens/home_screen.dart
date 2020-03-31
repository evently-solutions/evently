import 'package:evently/services/firebase/dao/firebase_dao.dart';
import 'package:evently/utilities/date_formatter.dart';
import 'package:evently/widgets/event_card.dart';
import 'package:evently/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  DateFormatter dateFormatter = DateFormatter();
  FirebaseDAO dao = FirebaseDAO();

  @override
  Widget build(BuildContext context) {
    dao.logSearches();
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Header('Recommended For You'),
          EventCard(
            imageUrl:
                'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
            title: 'Marc Anthony',
            date: 'April 3, 2020',
            venueName: 'test',
          ),
          Divider(),
          Header('Recently Viewed'),
          EventCard(
            imageUrl:
                'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
            title: 'Marc Anthony',
            date: 'December 31, 2020',
            venueName: 'test',
          ),
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
          Header('Similar to...'),
        ],
      ),
    );
  }
}
