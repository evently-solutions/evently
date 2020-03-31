import 'dart:convert';
import 'dart:async';

import 'package:evently/models/eventful_event_detail_result.dart';

import 'package:evently/models/eventful_search_result.dart';
import 'package:http/http.dart' as http;

class EventfulClient {
  Future<EventfulSearchResult> getEventsByKeywords(keywords) async {
    String url = 'http://api.eventful.com/json/events/search?app_key=tjDKNcBkFvMpqh3G&date=Future&sort_order=popularity&image_sizes=block250&location=Phoenix&keywords=';
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
          imageUrl: event['image'] != null
              ? event['image']['block250']['url']
              : 'none',
          startTime: event['start_time'],
          venueName: event['venue_name'],
          venueAddress: event['venue_address'],
          cityName: event['city_name'],
          state: event['region_name'],
          venueUrl: event['venue_url']));
    }

    Events events = new Events(eventList: eventList);

    EventfulSearchResult result = new EventfulSearchResult(
        totalItems: int.parse(json['total_items']),
        pageNumber: int.parse(json['page_number']),
        pageSize: int.parse(json['page_size']),
        pageCount: int.parse(json['page_count']),
        events: events);

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
    return EventfulEventDetailResult(
        id: json['id'],
        imageUrl: json['images']['image'][0]['block250']['url'],
        title: json['title'] != null ? json['title'] : '',
        description: json['description'] != null ? json['description'] : 'No description provided.',
        date: json['start_time'] != null ? json['start_time'] : '',
        venueName: json['venue_name'] != null ? json['venue_name'] : '',
        venueAddress: json['address'] != null ? json['address'] : '',
        venueCity: json['city'] != null ? json['city'] : '',
        venueRegion: json['region'] != null ? json['region'] : '',
        venueUrl: json['url'] != null ? json['url'] : '',
        vividSeatsUrl: json['links'] != null ? json['links']['link'][0]['url'] : ''
        );
  }

}
