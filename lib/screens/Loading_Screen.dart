import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {
  void geolocation_your_phone() async{

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


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
      body: Center(
        child: ElevatedButton(
          onPressed: (){
geolocation_your_phone();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
