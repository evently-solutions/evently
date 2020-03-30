import 'package:evently/screens/event_details_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String date;
  final String venueName;

  EventCard({this.id, this.imageUrl, this.title, this.date, this.venueName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
//      width: MediaQuery.of(context).size.width / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(EventDetailsScreen.routeName,
              arguments: {'id': id, 'title': title});
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imageUrl != 'none' && imageUrl.contains('http') ? Image.network(imageUrl, width: 110,) : Image.asset('assets/images/other/image-not-found.png', width: 110,),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        venueName,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
