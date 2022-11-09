import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather_model/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather(String cityName) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=bd43b76964344e30bd4132546220311&q=London&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}
