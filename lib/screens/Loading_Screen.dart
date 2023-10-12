import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast_and_current_location/location.dart';
import 'package:http/http.dart';
double? latitude_weather;
double? longitude_wather;
class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {
  void geolocation_your_phone() async{
Location l = await Location();
 l.getCurrentLocation();
 longitude_wather=l.Longitude_number;
 latitude_weather=l.Latitude_number;
//print(l.Longitude_number);
//print(l.Latitude_number);
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
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=af66f72d821d122b97e4d80e5249a27f'));
    print('this is api:----------> '+response.body);
    print( response.statusCode);
  }
  @override
  Widget build(BuildContext context) {
    get_Data_from_api();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Latitude: $latitude_weather"),
            Text("Longitude: $longitude_wather"),
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
//today i use api id i just create account in openweather website and got email where they give me api id and they give me sample of london which is very helpfull for me