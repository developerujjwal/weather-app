import 'package:weather_forecast_and_current_location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apiidd="af66f72d821d122b97e4d80e5249a27f";
class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}
//
class _Loading_ScreenState extends State<Loading_Screen> {

  void geolocation_your_phone()async {
Location l =   new Location();
 await l.getCurrentLocation();

//get_Data_from_api();
Network_Helper network_helper = new Network_Helper('https://api.openweathermap.org/data/2.5/weather?lat=${l.Latitude_number}&lon=${l.Longitude_number}&appid=$apiidd&units=metric');

   var weather_Data=await network_helper.getdata();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return location_screen(weather_data: weather_Data,);
   }));
    /*print("Longitude_number: ---------  ------");
 print(l.Longitude_number);
//print(l.Latitude_number);
  print('current latitude: $latitude_weather');
  print('current longitude: $longitude_wather');*/
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    req();
geolocation_your_phone();
  }
  void req()async{
    LocationPermission permission = await Geolocator.requestPermission();
  }
  //Future<void> get_Data_from_api()async{




/*
    print("country: $country_name");
    print("weather_id: $weather_id");
    print("city: $city_api");
print("latitude: $coord_from_api");
print("weather: $weather_from_api");
    print("temperature: $temperature_from_api");*/

  //}//today i use api id i just create account in openweather website and got email where they give me api id and they give me sample of london which is very helpfull for me
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SpinKitDoubleBounce(
        size: 100,
        color: Colors.white,
      )
      /*SafeArea(
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
      ),*/
    );
  }
}
