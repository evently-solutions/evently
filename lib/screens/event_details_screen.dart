import 'package:evently/models/eventful_event_detail_result.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  static const routeName = '/eventDetails';

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  EventfulEventDetailResult eventfulEventDetailResult;
  bool _isInit = true;
  EventfulClient eventfulClient = EventfulClient();

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
        body: eventfulEventDetailResult == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.black38),
                      ),
                      Container(
//                        padding: EdgeInsets.only(top: 50),
                        alignment: Alignment.topCenter,
//                        child: CircleAvatar(
//                          radius: 100,
//                          backgroundImage: NetworkImage(
//                            eventfulEventDetailResult.imageUrl,
//                          ),
//                        ),
                        child: ClipRRect(
                          child: Image.network(eventfulEventDetailResult.imageUrl),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    eventfulEventDetailResult.title,
                    style: TextStyle(fontSize: 24, fontFamily: 'Montserrat'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'A test description',
                    style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                  ),
                ],
              )));
  }

  void getDetails(id) async {
    final result = await eventfulClient.getEventDetails(id);
    setState(() {
      eventfulEventDetailResult = result;
    });
  }
}
