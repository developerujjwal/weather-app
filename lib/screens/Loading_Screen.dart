import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

latitude_weather=position.latitude ;
longitude_wather=position.longitude;
    print(position);
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
  @override
  Widget build(BuildContext context) {
    
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
