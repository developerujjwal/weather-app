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
var condition_w;
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
temperature_of = (temp-273.15).toInt();
  var condition = weatherdata["weather"][0]["id"];
  condition_w=condition;
  weather_icon = weather.getweathericon(condition);
  Message_weather = weather.messageget(temperature_of!);
  print("country: $country_n");
  print("temperature: $temperature_of");
  print("city_g: $city_g");
  print("weather_Data: $weather_of_mine");

});
  }

String location_screen_wallpaper(){

  if(condition_w<300){
    return 'images/thunderstorm.jpg';
  }
  else if((condition_w)<400){

    return 'images/heavy_rain.jpg';
  }
  else if((condition_w)<600){

    return 'images/rainy.jpg';
  }
  else if((condition_w)<700)
  {

    return 'images/chill.jpg';
  }
  else if((condition_w)<800){

    return 'images/noraml_weather.jpg';
  }
  else if((condition_w)==800){

    return 'images/sunny_weather.jpg';
  }
  else if((condition_w) <=804){

    return 'images/cloudy.jpg';
  }
  else{

    return 'images/nothing.jpeg';
  }
}
  @override
  Widget build(BuildContext context) {
    double hheight = MediaQuery.of(context).size.height;
    double wwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(location_screen_wallpaper(),),opacity: 90,
        fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                }, child: Icon(Icons.location_city,size: 50,), )
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$temperature_of°C',style: TextStyle(fontSize: 120),),
                Text('$weather_icon ',style: TextStyle(fontSize: 50),)
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$Message_weather in $city_g $country_n',style: TextStyle(fontSize: 50,),),
            )
          ],
        ),
      ),
      ),
    );
  }
}
//




