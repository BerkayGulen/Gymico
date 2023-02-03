import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Weather {
  String location = 'izmir';
  int woeid_izmir = 2344117;
  int temperature;

  //String weather;
  String abbreviation = '';
  String time = '';
  String weatherUrl = '';

  // get weather information from api for izmir
  Future<void> getWeather() async {
    Response response = await get('https://www.metaweather.com/api/location/' + woeid_izmir.toString());
    Map result = jsonDecode(response.body);
    var consolidated_weather = result['consolidated_weather'];
    var data = consolidated_weather[0];
    //get time
    var datetime = result['time'];
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(03.toString())));
    time = DateFormat.jm().format(now);
    //set time, weather and weather url
    temperature = data['the_temp'].round();
    //weather = data['weather_state_name'].replaceAll(' ', '').toLowerCase();
    abbreviation = data['weather_state_abbr'];
    weatherUrl = 'https://www.metaweather.com//static/img/weather/png/' + abbreviation + '.png';
    print(weatherUrl);
  }
}
