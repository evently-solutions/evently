import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserService {

  static void setUserData(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', userData);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = json.decode(prefs.getString('userData'))['userId'];
    return userId.toString();
  }

  static Future<String> getExpiryDate() async {
    final prefs = await SharedPreferences.getInstance();
    String expiryDate = json.decode(prefs.getString('userData'))['expiryDate'];
    return expiryDate.toString();
  }
}