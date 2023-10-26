import 'package:flutter/material.dart';
const k_textfield_decoration=InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City',
  icon: Icon(Icons.location_city,color: Colors.white,),
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),

);