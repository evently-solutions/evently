import 'package:flutter/foundation.dart';

class EventfulSearchResult with ChangeNotifier {
  int totalItems;
  int pageNumber;
  int pageSize;
  int pageCount;
  Events events;

  EventfulSearchResult(
      {this.totalItems,
      this.pageNumber,
      this.pageSize,
      this.pageCount,
      this.events});
}

class Events {
  List<Event> eventList;

  Events({this.eventList});
}

class Event {
  String id;
  String url;
  String title;
  String imageUrl;
  String startTime;
  String venueName;
  String venueAddress;
  String cityName;
  String state;
  String venueUrl;

  Event(
      {this.id,
      this.url,
      this.title,
      this.imageUrl,
      this.startTime,
      this.venueName,
      this.venueAddress,
      this.cityName,
      this.state,
      this.venueUrl});
}
