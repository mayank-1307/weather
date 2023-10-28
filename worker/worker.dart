import 'dart:convert';
import 'package:http/http.dart';

class worker
{
  String? location;
  worker({required this.location})
  {
    location=this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async
  {

    try{
        var url=Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=${location}&appid=12d3e1196b2a7a0ba055c3917dd2466d");
        Response response = await get(url);
        Map decodeData = jsonDecode(response.body);


        List weather_data = ((decodeData['weather'] ?? []) as List);
        Map weather_main_data = weather_data.length > 0 ? weather_data[0] : "";
        String getMain_des = weather_main_data['main'];
        String getDescr = weather_main_data['description'];
        // print(weather_data);
        // print(weather_main_data['main']);

        Map temp_data = decodeData['main'];
        Map wind = decodeData['wind'];
        String getHumidity = temp_data['humidity'].toString();
        double k=wind['speed']/0.2777777777778;
        String getAir_speed = k.toString();
        String getTemp = (temp_data['temp']-273.15).toString();
        temp = getTemp;
        humidity=getHumidity;
        air_speed=getAir_speed;
        description= getDescr;
        main = getMain_des;
        icon=weather_main_data["icon"].toString();
  }catch(e)
    {
      temp = "Can't Find Data";
      humidity="Can't Find Data";
      air_speed="Can't Find Data";
      description= "Can't Find Data";
      main = "Can't Find Data";
      icon="03n";
    }
  }
}