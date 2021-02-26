import 'dart:io';

import 'package:otw/constants.dart';
import 'package:otw/provider/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MyGetFunctions {
  static Future getCategories() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token =
        sharedPreferences.getStringList("user_details")[3].toString();

    http.Response response = await http.get(
      "${baseUrl}voteapp/postcategories/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (response.statusCode < 210) {
    } else {}
    return json.decode(response.body);
  }

  static getWeeklyPost() async {
    List<WeeklyPost> data1 = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token =
        sharedPreferences.getStringList("user_details")[3].toString();

    http.Response response = await http.get(
      "${baseUrl}voteapp/weeklypost/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (response.statusCode < 210) {
      // print("WeeklyPost => ${json.decode(response.body).length}");
      List data = json.decode(response.body);
      for (var i in data) {
        data1.add(WeeklyPost.fromJson(i));
      }
    } else {
      print(response.body); 
    }
    return data1;
  }

  static Future<List> getWeeklyPost2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token =
        sharedPreferences.getStringList("user_details")[3].toString();

    http.Response response = await http.get(
      "${baseUrl}voteapp/weeklypost/",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (response.statusCode < 210) {
      print("WeeklyPost => ${json.decode(response.body).length}");
    } else {
      print(response.body);
    }
    return json.decode(response.body);
  }
}
