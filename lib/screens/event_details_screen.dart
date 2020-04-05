import 'dart:io';

import 'package:evently/models/eventful_event_detail_result.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:evently/utilities/unique_color_generator.dart';
import 'package:evently/utilities/date_formatter.dart';
import 'package:evently/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatefulWidget {
  static const routeName = '/eventDetails';

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  EventfulEventDetailResult eventDetails;
  bool _isInit = true;
  EventfulClient eventfulClient = EventfulClient();
  DateFormatter dateFormatter = DateFormatter();

  @override
  Widget build(BuildContext context) {
    final parameters =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    if (_isInit) {
      getDetails(parameters['id']);
      setState(() {
        _isInit = false;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(parameters['title']),
      ),
      body: eventDetails == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: UniqueColorGenerator.getColor()
                                .withOpacity(0.5),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            child: Image.network(eventDetails.imageUrl),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      eventDetails.title,
                      style: TextStyle(fontSize: 32, fontFamily: 'Montserrat'),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 10,
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Text(
                      'Event Info',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          color: Colors.black38),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    // if start time is present, show it
                    eventDetails.date != ''
                        ? Text(
                            dateFormatter.formatDate(eventDetails.date),
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Montserrat'),
                          )
                        : SizedBox(),

                    SizedBox(
                      height: 20,
                    ),

                    // if venue details are present, show them
                    eventDetails.venueName != ''
                        ? Column(
                            children: <Widget>[
                              Text(
                                '${eventDetails.venueName}\n${eventDetails.venueAddress}\n${eventDetails.venueCity}, ${eventDetails.venueRegion}',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Montserrat'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 10,
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: new RaisedButton(
                        color: Colors.red,
                        onPressed: () => _launchURL(eventDetails.vividSeatsUrl),
                        child: new Text(
                          'Get Tickets',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void getDetails(id) async {
    final result = await eventfulClient.getEventDetails(id);
    setState(() {
      eventDetails = result;
    });
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
