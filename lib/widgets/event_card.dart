import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  EventCard({this.imageUrl, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 395,
      child: Card(
        elevation: 5,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontSize: 18),),
                    Text(date, style: TextStyle(fontSize: 12),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
