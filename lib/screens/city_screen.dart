import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/screens/location_screen.dart';
import 'package:weather_forecast_and_current_location/utilities/constants.dart';
import 'package:weather_forecast_and_current_location/services/weather.dart';
import 'package:geolocator/geolocator.dart';

class City_screen extends StatefulWidget {
  const City_screen({super.key});

  @override
  State<City_screen> createState() => _City_screenState();
}

class _City_screenState extends State<City_screen> {
  bool _isLoading = false;
  String text_field_input = "";

  @override
  void initState() {
    super.initState();
    req();
  }

  void req() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/screen_city.jpg"),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: k_textfield_decoration,
                      onChanged: (value) {
                        text_field_input = value;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      Weathermodel livelocation = new Weathermodel();
                      var data_weather = await livelocation.city_location_weather(text_field_input);

                      setState(() {
                        _isLoading = false;
                      });

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return location_screen(weather_data: data_weather);
                      }));
                    },
                    child: Text(
                      "Get Weather",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
