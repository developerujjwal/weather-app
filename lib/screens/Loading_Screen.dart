import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast_and_current_location/location.dart';
import 'package:http/http.dart';
const apiidd="af66f72d821d122b97e4d80e5249a27f";
class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {
    double? latitude_weather;
   double? longitude_wather;
   String? country_n;
   String? city_g;
   String? weather_of_mine;
   double? temperature_of;
  void geolocation_your_phone()async {
Location l =   new Location();
 await l.getCurrentLocation();
 longitude_wather=l.Longitude_number;
 latitude_weather=l.Latitude_number;
get_Data_from_api();
print("Longitude_number: ---------  ------");
 print(l.Longitude_number);
//print(l.Latitude_number);
  print('current latitude: $latitude_weather');
  print('current longitude: $longitude_wather');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    req();

  }
  void req()async{
    LocationPermission permission = await Geolocator.requestPermission();
  }
  Future<void> get_Data_from_api()async{
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude_weather&lon=$longitude_wather&appid=$apiidd'));
    print('this is api:----------> '+response.body);
    //TODO: here i learn how to access data from api body or response
    print( response.statusCode);
    String data = response.body;
    var jd= jsonDecode(data);
    var temperature_from_api=jd['main']['temp'];
    var coord_from_api=jd['coord']['lat'];
    var weather_from_api=jd['weather'][0]['description'];
    var weather_id=jd["weather"][0]["id"];
    var city_api= jd["name"];
    var country_name=jd["sys"]["country"];

    country_n=jd["sys"]["country"];
    city_g=jd["name"];
    weather_of_mine=jd["weather"][0]["description"];
    temperature_of=jd["main"]["temp"];



    print("country: $country_name");
    print("weather_id: $weather_id");
    print("city: $city_api");
print("latitude: $coord_from_api");
print("weather: $weather_from_api");
    print("temperature: $temperature_from_api");

  }//today i use api id i just create account in openweather website and got email where they give me api id and they give me sample of london which is very helpfull for me
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Latitude: $latitude_weather"),
            Text("Longitude: $longitude_wather"),
            Text(" Country: $country_n"),
            Text("city: $city_g"),
            Text("weather: $weather_of_mine"),
            Text("temp: $temperature_of"),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {

                    geolocation_your_phone();

                  });},
                child: Text('Get Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
