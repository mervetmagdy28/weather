import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/weather_model/weather_model.dart';

import '../services/weatherService.dart';

class SearchPage extends StatelessWidget {
  SearchPage({required this.updateUi});
  String? cityName;
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),

      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (data)async{
              cityName= data;
              WeatherService service =WeatherService();
              WeatherModel weather =await service.getWeather(cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData =weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
             contentPadding: EdgeInsets.only(top:30, left: 15, bottom: 30),
              label: Text("Search"),

              border: OutlineInputBorder(),
              hintText: "Enter a City",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}