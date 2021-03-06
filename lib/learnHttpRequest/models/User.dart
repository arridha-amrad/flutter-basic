// result we want to get
// {
//     "data": {
//         "id": 2,
//         "email": "janet.weaver@reqres.in",
//         "first_name": "Janet",
//         "last_name": "Weaver",
//         "avatar": "https://reqres.in/img/faces/2-image.jpg"
//     }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<User> connectToAPI(String id) async {
    final String httpUrl = "https://reqres.in/api/users/" + id;
    var result = await http.get(httpUrl);
    var jsonObject = json.decode(result.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }

  static Future<List<User>> getUsers(String page) async {
    final String httpUrl = "https://reqres.in/api/users?page=" + page;
    var result = await http.get(httpUrl);
    var jsonObject = json.decode(result.body);
    List<dynamic> listUsers = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (var i = 0; i < listUsers.length; i++) {
      users.add(User.createUser(listUsers[i]));
    }

    return users;
  }
}
