class WeatherModel
{
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel({required this.weatherStateName, required this.date, required this.maxTemp, required this.minTemp, required this.temp});

  factory WeatherModel.fromjson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(weatherStateName:jsonData['condition']['text'] , date: data['location']['localtime'], maxTemp: jsonData['maxtemp_c'], minTemp: jsonData['mintemp_c'], temp: jsonData['avgtemp_c']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "temp =$temp \nminTemp =$minTemp\nmaxTemp =$maxTemp";
  }
}