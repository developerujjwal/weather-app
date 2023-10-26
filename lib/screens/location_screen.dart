import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/services/weather.dart';
import 'city_screen.dart';
class location_screen extends StatefulWidget {
  location_screen({required this.weather_data});
  final weather_data;

  @override
  State<location_screen> createState() => _location_screenState();
}

class _location_screenState extends State<location_screen> {
Weathermodel weather = new Weathermodel();
String? Message_weather;
String? weather_icon;
  String? country_n;
  String? city_g;
  String? weather_of_mine;
 int? temperature_of;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget weather : ");
    updateUI(widget.weather_data);
  }

  void updateUI(dynamic weatherdata){
setState(() {
if(weatherdata==null){
  temperature_of=0;
  city_g=" ";
  Message_weather=" unable to get weather dats";
  weather_icon="Error";
  return;
}
  country_n=weatherdata["sys"]["country"];
  city_g=weatherdata["name"];
  weather_of_mine=weatherdata["weather"][0]["description"];
  double temp=weatherdata["main"]["temp"];
  temperature_of=temp.toInt();
  var condition = weatherdata["weather"][0]["id"];
  weather_icon = weather.getweathericon(condition);
  Message_weather = weather.messageget(temperature_of!);
  print("country: $country_n");
  print("temperature: $temperature_of");
  print("city_g: $city_g");
  print("weather_Data: $weather_of_mine");

});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/01.jpg'),
        fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(onPressed: ()async{


                   var weatherdatadata = await weather.Current_Location_Live();
                updateUI(weatherdatadata);
                }, child: Icon(Icons.near_me, size: 50,)),
                TextButton(onPressed: ()async{
                 var navigator_output= await Navigator.push(context, MaterialPageRoute(builder: (context){
                    return City_screen();
                  }));
                 if(navigator_output!=null){

                   var city_l=await weather.city_location_weather(navigator_output);

                   updateUI(city_l);
                 }
                }, child: Icon(Icons.location_city,size: 50,))
              ],
            ),
            Row(
              children: [
                Text('$temperature_of'),
                Text('$weather_icon')
              ],
            ),
            Text('$Message_weather in $city_g $country_n')
          ],
        ),
      ),
      ),
    );
  }
}





