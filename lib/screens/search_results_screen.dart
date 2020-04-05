import 'package:evently/dao/firebase/firebase_dao.dart';
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
  EventfulClient eventfulClient = EventfulClient();
  EventfulSearchResult eventfulSearchResult;
  FirebaseDAO dao = FirebaseDAO();

  @override
  Widget build(BuildContext context) {
    final parameters =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    if (!_initialized) {
      if (parameters['searchType'] == 'keyword') {
        getEventsByKeywords(parameters['keywords']);
      } else if (parameters['searchType'] == 'category') {
        dao.persistCategorySearch(parameters['id']);
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
//                              eventfulSearchResult.totalItems.toString() +
//                                  ' events found',
                            'Showing first 30 results',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: eventfulSearchResult
                                .events.eventList.length,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            itemCount: eventfulSearchResult
                                .events.eventList.length,
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
    final result = await eventfulClient.getEventsByKeywords(id);
    setState(() {
      eventfulSearchResult = result;
    });
  }

  void getEventsByCategory(category) async {
    final result = await eventfulClient.getEventsByCategory(category);
    setState(() {
      eventfulSearchResult = result;
    });
  }
}
