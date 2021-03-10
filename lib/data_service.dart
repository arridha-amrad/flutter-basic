import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:try_flutter/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    const String API_KEY = "89ec47396da0d6a31061436f3d96eaf2";

    final queryParameter = {'q': city, 'appid': API_KEY, 'units': 'metric'};

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);

    final response = await http.get(uri);

    // print(response.body);

    final json = jsonDecode(response.body);
    // print("jsonDecode result : $json");
    return WeatherResponse.fromJson(json);
  }
}
