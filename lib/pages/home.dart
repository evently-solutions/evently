import 'package:evently/widgets/event_card_list.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'New Events for You',
                  style: Theme.of(context).textTheme.headline,
                ),
                EventCardList(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Recent Searches',
                  style: Theme.of(context).textTheme.headline,
                ),
                EventCardList(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'My Community',
                  style: Theme.of(context).textTheme.headline,
                ),
                EventCardList(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Similar to...',
                  style: Theme.of(context).textTheme.headline,
                ),
                EventCardList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}