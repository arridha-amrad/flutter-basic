import 'dart:convert';

class Album {
  int id;
  int userId;
  String title;

  Album({this.id, this.userId, this.title});

  factory Album.fromJSON(Map<String, dynamic> jsonObject) {
    return Album(
        id: jsonObject['id'],
        userId: jsonObject['userId'],
        title: jsonObject['title']);
  }

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title};
}

List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJSON(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
