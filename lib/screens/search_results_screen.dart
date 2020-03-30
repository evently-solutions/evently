import 'package:evently/models/eventful_event_detail_result.dart';
import 'package:evently/models/eventful_search_result.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:evently/widgets/event_card.dart';
import 'package:flutter/material.dart';

class SearchResultsScreen extends StatefulWidget {
  static const routeName = '/searchResults';

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  var _initialized = false;
  EventfulSearchResult eventfulSearchResult;

  @override
  Widget build(BuildContext context) {
    final parameters =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    print('fetching data from search');
    if (!_initialized) {
      if (parameters['searchType'] == 'keyword') {
        print('searching by keyword ' + parameters['keywords'].toString());
        getEventsByKeywords(parameters['keywords']);
      } else if (parameters['searchType'] == 'category') {
        print('searching by category ' + parameters['id'].toString());
        getEventsByCategory(parameters['id']);
      }
      setState(() {
        _initialized = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      body: Center(
        child: parameters['searchType'] == 'keyword'
            ? eventfulSearchResult == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Searching for ' + parameters['keywords'],
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CircularProgressIndicator(),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              eventfulSearchResult.totalItems.toString() +
                                  ' events found',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (ctx, i) => Row(
                              children: <Widget>[
                                EventCard(
                                  id: eventfulSearchResult
                                      .events.eventList[i].id,
                                  title: eventfulSearchResult
                                      .events.eventList[i].title,
                                  date: eventfulSearchResult
                                      .events.eventList[i].startTime,
                                  imageUrl: eventfulSearchResult
                                      .events.eventList[i].imageUrl,
                                  venueName: eventfulSearchResult
                                      .events.eventList[i].venueName,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
            : eventfulSearchResult == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Searching for ' + parameters['title'],
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CircularProgressIndicator(),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              eventfulSearchResult.totalItems.toString() +
                                  ' events found',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (ctx, i) => Row(
                              children: <Widget>[
                                EventCard(
                                  id: eventfulSearchResult
                                      .events.eventList[i].id,
                                  title: eventfulSearchResult
                                      .events.eventList[i].title,
                                  date: eventfulSearchResult
                                      .events.eventList[i].startTime,
                                  imageUrl: eventfulSearchResult
                                      .events.eventList[i].imageUrl,
                                  venueName: eventfulSearchResult
                                      .events.eventList[i].venueName,
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

  void getEventsByKeywords(id) async {
    final result = await EventfulClient.getEventsByKeywords(id);
    setState(() {
      eventfulSearchResult = result;
      print(eventfulSearchResult);
    });
  }

  void getEventsByCategory(category) async {
    final result = await EventfulClient.getEventsByCategory(category);
    setState(() {
      eventfulSearchResult = result;
      print(eventfulSearchResult);
    });
  }
}
