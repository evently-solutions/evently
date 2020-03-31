import 'dart:convert';
import 'dart:async';

import 'package:evently/models/eventful_event_detail_result.dart';
import 'package:provider/provider.dart';

import 'package:evently/models/eventful_search_result.dart';
import 'package:http/http.dart' as http;

class EventfulClient {
  Future<EventfulSearchResult> getEventsByKeywords(keywords) async {
    String url = 'http://api.eventful.com/json/events/search?app_key=tjDKNcBkFvMpqh3G&date=Future&sort_order=popularity&image_sizes=block250&location=Phoenix&keywords=';
    print(url + keywords);
    EventfulSearchResult result;
    try {
      final response = await http.get(Uri.encodeFull(url + keywords));
      final responseData = json.decode(response.body);
      result = _mapResult(responseData);
    } catch (error) {
      print(error);
    }
    return result;
  }

  Future<EventfulSearchResult> getEventsByCategory(category) async {
    String url = 'http://api.eventful.com/json/events/search?app_key=tjDKNcBkFvMpqh3G&location=Phoenix&date=Future&sort_order=popularity&image_sizes=block250&category=';
    print(url + category.toString());
    EventfulSearchResult result;
    try {
      final response = await http.get(Uri.encodeFull(url + category.toString()));
      final responseData = json.decode(response.body);
      result = _mapResult(responseData);
    } catch (error) {
      print(error);
    }
    return result;
  }

  EventfulSearchResult _mapResult(dynamic json) {
    List<Event> eventList = [];
    for (var event in json['events']['event']) {
      eventList.add(new Event(
        id: event['id'],
        url: event['url'],
        title: event['title'],
        imageUrl: event['image'] != null ? event['image']['block250']['url']: 'none',
        startTime: event['start_time'],
        venueName: event['venue_name'],
        venueAddress: event['venue_address'],
        cityName: event['city_name'],
        state: event['region_name'],
        venueUrl: event['venue_url']
      ));
    }

    Events events = new Events(eventList: eventList);

    EventfulSearchResult result = new EventfulSearchResult(
        totalItems: int.parse(json['total_items']),
        pageNumber: int.parse(json['page_number']),
        pageSize: int.parse(json['page_size']),
        pageCount: int.parse(json['page_count']),
        events: events);

    for(Event event in result.events.eventList) {
      print(event.title);
    }

    return result;
  }

  Future<EventfulEventDetailResult> getEventDetails(id) async {
    String url = 'http://api.eventful.com/json/events/get?app_key=tjDKNcBkFvMpqh3G&image_sizes=block250&id=';
    EventfulEventDetailResult result;
    try {
      final response = await http.get(Uri.encodeFull(url + id));
      final responseData = json.decode(response.body);
      result = _mapDetailResult(responseData);

    } catch (error) {
      print(error);
    }
    return result;
  }

  EventfulEventDetailResult _mapDetailResult(dynamic json) {
    print(json['description']);
    return EventfulEventDetailResult(
        description: 'TBD',
        imageUrl: json['images']['image'][0]['block250']['url'],
        title: json['title']
    );
  }

}
