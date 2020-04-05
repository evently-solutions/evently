import 'package:evently/dao/firebase/firebase_dao.dart';
import 'package:evently/models/eventful_search_result.dart';
import 'package:evently/screens/other_profile_screen.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:evently/utilities/date_formatter.dart';
import 'package:evently/widgets/header.dart';
import 'package:evently/widgets/home_screen_event_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateFormatter dateFormatter = DateFormatter();
  EventfulClient eventfulClient = EventfulClient();
  FirebaseDAO dao = FirebaseDAO();
  EventfulSearchResult recommendedResults;
  bool _initialized = false;
  bool _reloadResults = false;

  @override
  Widget build(BuildContext context) {
    final parameters = ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(parameters);
    _reloadResults = parameters['reloadResults'].toLowerCase() == 'true';
    print(_reloadResults);
    if(!_initialized && /*_reloadResults &&*/ recommendedResults == null) {
      // get events by category for user
      getCategories().then((categories) {
        print(categories);
        // recommend events in those categories
        getEventsByCategory(categories);
        setState(() {
          _initialized = true;
          parameters['reloadResults'] = 'false';
        });
      });
    }


    return recommendedResults == null ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Loading your events',
            style:
            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CircularProgressIndicator(),
      ],
    )
        : Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Header('Recommended For You'),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3.5,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendedResults.pageSize,
              itemBuilder: (ctx, i) =>
                  HomeScreenEventCard(
                      id: recommendedResults.events.eventList[i].id,
                      imageUrl: recommendedResults
                          .events.eventList[i].imageUrl,
                      title: recommendedResults
                          .events.eventList[i].title,
                    date: dateFormatter.formatDate(recommendedResults
                        .events.eventList[i].startTime),
                    venueName: recommendedResults
                        .events.eventList[i].venueName,
                    ),
            ),
          ),
          Divider(),
          Header('Recently Viewed'),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3.5,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                HomeScreenEventCard(
                  id: 'E0-001-132353164-1',
                  imageUrl:
                  'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
                  title: 'Marc Anthony',
                  date: '2020-04-12',
                  venueName: 'test',
                ),
                HomeScreenEventCard(
                  id: 'E0-001-132353164-1',
                  imageUrl:
                  'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
                  title: 'Marc Anthony',
                  date: '2020-04-12',
                  venueName: 'test',
                ),
                HomeScreenEventCard(
                  id: 'E0-001-132353164-1',
                  imageUrl:
                  'http://d1marr3m5x4iac.cloudfront.net/images/block250/I0-001/003/840/471-2.jpeg_/marc-anthony-71.jpeg',
                  title: 'Marc Anthony',
                  date: '2020-04-12',
                  venueName: 'test',
                ),
              ],
            ),
          ),
          Header('My Connections'),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 90,
            width: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (ctx, i) =>
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                OtherProfileScreen.routeName,
                                arguments: {});
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/samples/profile_picture.jpg'),
                            radius: 40,
                          ),
                        ),
                      ],
                    )),
          ),
          Divider(),
//          Header('Similar to...'),
        ],
      ),
    );
  }

  void getEventsByCategory(category) async {
    print(category);
    final result = await eventfulClient.getEventsByCategory(category);
    setState(() {
      recommendedResults = result;
    });
  }

  Future<String> getCategories() async {
    final categories = await dao.getSearchedCategories();
    return categories;
  }
}


