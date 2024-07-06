import 'package:weather_forecast_and_current_location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecast_and_current_location/services/weather.dart';
class Loading_Screen extends StatefulWidget {
  Loading_Screen({required this.loadingscreendata});
  final loadingscreendata;

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {

  void geolocation_your_phone()async {


   Navigator.push(context, MaterialPageRoute(builder: (context){
     return location_screen(weather_data: widget.loadingscreendata,);
   }));
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
