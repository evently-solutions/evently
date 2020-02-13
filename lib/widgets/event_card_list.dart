import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'event_card.dart';

class EventCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          EventCard(
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              title: 'Testing title',
              date: DateFormat.yMMMd().format(DateTime.now())),
          EventCard(
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              title: 'Testing title',
              date: DateFormat.yMMMd().format(DateTime.now())),
          EventCard(
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              title: 'Testing title',
              date: DateFormat.yMMMd().format(DateTime.now())),
          EventCard(
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              title: 'Testing title',
              date: DateFormat.yMMMd().format(DateTime.now())),
        ],
      ),
    );
  }
}
