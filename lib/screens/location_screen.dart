import 'package:flutter/material.dart';
class location_screen extends StatefulWidget {
  location_screen({required this.weather_data});
  final weather_data;

  @override
  State<location_screen> createState() => _location_screenState();
}

class _location_screenState extends State<location_screen> {

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

country_n=weatherdata["sys"]["country"];
city_g=weatherdata["name"];
weather_of_mine=weatherdata["weather"][0]["description"];
double temp=weatherdata["main"]["temp"];
temperature_of=temp.toInt();

print("country: $country_n");
print("temperature: $temperature_of");
print("city_g: $city_g");
print("weather_Data: $weather_of_mine");

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
                TextButton(onPressed: (){}, child: Icon(Icons.near_me, size: 50,)),
                TextButton(onPressed: (){}, child: Icon(Icons.location_city,size: 50,))
              ],
            ),
            Row(
              children: [
                Text('$temperature_of'),
                Text('*')
              ],
            ),
            Text('its time in san francisco')
          ],
        ),
      ),
      ),
    );
  }
}





