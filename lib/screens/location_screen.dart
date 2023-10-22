import 'package:flutter/material.dart';
class location_screen extends StatefulWidget {
  location_screen({required this.weather_data});
  final weather_data;

  @override
  State<location_screen> createState() => _location_screenState();
}

class _location_screenState extends State<location_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget weather : ");
    print(widget.weather_data);
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
                Text('35'),
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




/*
country_n=jd["sys"]["country"];
city_g=jd["name"];
weather_of_mine=jd["weather"][0]["description"];
temperature_of=jd["main"]["temp"];
*/
