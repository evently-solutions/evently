import 'dart:convert';
import 'dart:async';

import 'package:evently/services/user/user_service.dart';
import 'package:http/http.dart' as http;


class FirebaseDAO {

  static const baseUrl = 'https://evently-ee843.firebaseio.com/';

  Future<void> logSearches(category) async {

    String userId = await UserService.getUserId();
    String userResource = 'users/$userId';
    String userResourceUrl = baseUrl + userResource;

    print('calling backend');
    String url = userResourceUrl + '/searches.json';
    print(url);
    try {
      final response = await http.post(
        url, body: json.encode({'test': 'testing'})
      );
      final responseData = json.decode(response.body);
      print(responseData);
    } catch (error) {
      print(error);
    }
  }

  Future<void> persistCategorySearch(category) async {
    print('persisting categories');
    String userId = await UserService.getUserId();
    String userResource = 'users/$userId';
    String userResourceUrl = baseUrl + userResource;

    String url = userResourceUrl + '/categories.json';
    print(url);
    try {
      final response = await http.patch(
          url, body: json.encode({category: category})
      );
      final responseData = json.decode(response.body);
      print(response);
    } catch (error) {
      print(error);
    }
  }

  Future<String> getSearchedCategories() async {
    print('fetching searched categories');
    String userId = await UserService.getUserId();
    String userResource = 'users/$userId';
    String userResourceUrl = baseUrl + userResource;

    String url = userResourceUrl + '/categories.json';
    print(url);
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body);
      String categories = '';
      for (var key in responseData.keys) {
        categories += key + ',';
      }
      return categories;
    } catch (error) {
      print(error);
    }
  }

}