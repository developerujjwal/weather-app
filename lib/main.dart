import 'package:flutter/material.dart';
void main(){
  runApp(myWeather());
}
class myWeather extends StatelessWidget {
  const myWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
       theme: ThemeData.dark(),
        home: LoginScreen(),
      );
  }
}
