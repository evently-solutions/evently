import 'dart:convert';
import 'dart:async';

import 'package:evently/services/user/user_service.dart';
import 'package:http/http.dart' as http;


class FirebaseDAO {

  static const baseUrl = 'https://evently-ee843.firebaseio.com/';

  Future<void> logSearches() async {

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

}