import 'package:evently/constants/event_categories.dart';
import 'package:evently/models/eventful_search_result.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:evently/widgets/category_item.dart';
import 'package:evently/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FindEventScreen extends StatefulWidget {
  static const routeName = '/findEvent';

  @override
  _FindEventScreenState createState() => _FindEventScreenState();
}

class _FindEventScreenState extends State<FindEventScreen> {
  bool keywordSearch = false;
  EventfulSearchResult eventfulSearchResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: TextField(
                      onChanged: (value) {},
                      onSubmitted: (keywords) async {
                        setState(() {
                          keywordSearch = true;
                        });
                        final result =
                            await EventfulClient.getEventsByKeywords(keywords);
                        setState(() {
                          eventfulSearchResult = result;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          labelStyle: TextStyle(fontFamily: 'Montserrat'),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.clear)),
                    ),
                  ),
                ],
              ),
            ),
            keywordSearch
                ? eventfulSearchResult != null
                    ? Expanded(
                        child: ListView.builder(
                          itemCount:
                              eventfulSearchResult.events.eventList.length,
                          itemBuilder: (ctx, i) => EventCard(
                            id: eventfulSearchResult.events.eventList[i].id,
                            imageUrl: eventfulSearchResult
                                .events.eventList[i].imageUrl,
                            title:
                                eventfulSearchResult.events.eventList[i].title,
                            date: eventfulSearchResult
                                .events.eventList[i].startTime,
                            venueName: eventfulSearchResult
                                .events.eventList[i].venueName,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                : Container(),
            keywordSearch
                ? Container()
                : Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                    child: Text(
                      'Browse Categories',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
            keywordSearch
                ? Container()
                : Expanded(
                    child: GridView(
                      children: categories
                          .map((data) => CategoryItem(
                              data.id, data.title, data.imagePath, data.color))
                          .toList(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
