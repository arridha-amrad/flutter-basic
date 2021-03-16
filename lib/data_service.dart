import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:try_flutter/post_model.dart';

class DataService {
  static const String BASE_URL = "jsonplaceholder.typicode.com";

  static Future<List<Post>> getPosts() async {
    var posts = <Post>[];
    try {
      final uri = Uri.https(BASE_URL, '/posts');
      final response = await http.get(uri);
      // print('response : ${response.body}');
      final json = jsonDecode(response.body) as List;
      // print('json : $json');
      posts = json.map((e) => Post.fromJson(e)).toList();
      // print('posts : $posts');
      // print(posts.map((e) => e.body));
    } catch (e) {
      throw e;
    }
    return posts;
  }
}
