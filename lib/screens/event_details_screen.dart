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

  @override
  Widget build(BuildContext context) {
    final parameters =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    if(_isInit) {
      getDetails(parameters['id']);
      setState(() {
        _isInit = false;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(parameters['title']),
      ),
      body: eventfulEventDetailResult != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                          child: Image.network(
                            eventfulEventDetailResult.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(eventfulEventDetailResult.description)
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getDetails(id) async {
    print('fetching details');
    final result = await EventfulClient.getEventDetails(id);
    print(result);
//    setState(() {
//      eventfulEventDetailResult = result;
//    });
  }
}
