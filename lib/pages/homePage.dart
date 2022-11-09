import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/searchPage.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/weather_model/weather_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void updateUi(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchPage(updateUi: updateUi,);
          },));
        }, icon: const Icon(Icons.search))
      ],
      title: const Text("Weather App"),
    ),

      body: Provider.of<WeatherProvider>(context,listen: false).weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("there is no weather 😔 start", style: TextStyle(fontSize: 23),),
            Text("searching now 🔍\n\n", style: TextStyle(fontSize: 23),)
          ],
        ),
      ):Center(
        child: Container(
          color: Colors.orangeAccent,
          child: Center(
            child: Column(
              children: [
                Spacer(flex:5,),
                Text("Cairo", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("Updated 3/11/2022", style: TextStyle(fontSize: 16, ),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage("assets/images/rainy.png")),
                    Text("30", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        Text("max:32",style: TextStyle(fontSize: 12),),
                        Text("min:20",style: TextStyle(fontSize: 12),)
                      ],
                    )

                  ],
                ),
                Spacer(),
                Text("Clear",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(flex: 8,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
