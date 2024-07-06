import 'package:weather_forecast_and_current_location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecast_and_current_location/services/weather.dart';
class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {

  void geolocation_your_phone()async {
Weathermodel livelocation = new Weathermodel();
var data_weather = await livelocation.Current_Location_Live();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return location_screen(weather_data: data_weather,);
   }));
  }
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    req();
geolocation_your_phone();
  }
  void req()async{
    LocationPermission permission = await Geolocator.requestPermission();
  }
    @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SpinKitDoubleBounce(
        size: 100,
        color: Colors.white,
      )
    );
  }
}
