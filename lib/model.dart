/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },
  "name": "Mountain View",
}     
 */

class Weather {
  final String description;
  final String icon;

  Weather({required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(description: json['description'], icon: json['icon']);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    // celcius degree comes with type int
    final temperature = json['temp'].toString();
    return TemperatureInfo(temperature: double.tryParse(temperature) ?? 0);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo temperatureInfo;
  final Weather weatherInfo;

  String? get iconUrl {
    return "https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png";
  }

  WeatherResponse(
      {required this.cityName,
      required this.temperatureInfo,
      required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final tempInfoJSON = json['main'];
    final weatherInfoJSON = json['weather'][0];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJSON);
    final weatherInfo = Weather.fromJson(weatherInfoJSON);

    return WeatherResponse(
        cityName: cityName,
        temperatureInfo: tempInfo,
        weatherInfo: weatherInfo);
  }
}
