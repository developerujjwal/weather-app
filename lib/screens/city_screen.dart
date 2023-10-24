import 'package:flutter/material.dart';
class City_screen extends StatefulWidget {
  const City_screen({super.key});

  @override
  State<City_screen> createState() => _City_screenState();
}

class _City_screenState extends State<City_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/city_background.jpg"),fit: BoxFit.cover)),
     child: SafeArea(
       child: Column(
         children: [
           Align(
               alignment: Alignment.topLeft,
               child: TextButton(onPressed: (){}, child: Icon(Icons.arrow_back_ios))),
           Container(
             margin: EdgeInsets.all(15),
             child: null,
           ),
           TextButton(onPressed: (){}, child: Text("Get Weather"))

         ],
       ),
     ),
      ),
    );
  }
}
