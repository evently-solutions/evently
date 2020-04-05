import 'package:evently/screens/event_details_screen.dart';
import 'package:evently/screens/search_results_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenEventCard extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String venueName;
  final String imageUrl;

  HomeScreenEventCard(
      {this.id, this.title, this.date, this.venueName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String titleFormatted = this.title.length > 20
        ? this.title.substring(0, 20) + '...'
        : this.title;
    String venueNameFormatted = this.venueName.length > 20
        ? this.venueName.substring(0, 20) + '...'
        : this.venueName;
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 1.7,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(EventDetailsScreen.routeName,
              arguments: {'id': id, 'title': title});
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Container(
                alignment: Alignment.topCenter,
                child: imageUrl != 'none' && imageUrl.contains('http')
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/other/image-not-found.png',
                        fit: BoxFit.cover, height: 100, alignment: Alignment.topCenter,
                      ),
              ),
            ),
            Container(
              height: 65,
              color: Colors.black45,
              alignment: Alignment.bottomRight,
              child: Text(
                titleFormatted + '\n' + date + '\n' + venueNameFormatted,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
