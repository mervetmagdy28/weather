import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/homePage.dart';
import 'package:weather/providers/weather_provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        return Provider(create: (context){
         return WeatherProvider();
        },);

      },
      builder: (context, child) {
        // No longer throws
        return Text(context.watch<WeatherProvider>().toString());
      },
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
