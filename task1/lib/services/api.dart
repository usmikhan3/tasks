import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getPosts() async {
    try {
      Uri requestPath = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      var response = await http.get(requestPath);

      var decodedResponse = jsonDecode(response.body);

      List<dynamic> posts = decodedResponse as List<dynamic>;

      return posts;
    } catch (ex) {
      return [];
    }
  }

  static Future<List<dynamic>> getUsers() async {
    try {
      Uri requestPath = Uri.parse("https://jsonplaceholder.typicode.com/users");

      var response = await http.get(requestPath);

      var decodedResponse = jsonDecode(response.body);

      List<dynamic> users = decodedResponse as List<dynamic>;

      return users;
    } catch (ex) {
      return [];
    }
  }
}
