import 'package:diraction/views/button1.dart';
import 'package:diraction/views/counter.dart';
import 'package:diraction/views/first_screen.dart';
import 'package:diraction/views/mainscreen.dart';
import 'package:diraction/views/my_homepage.dart';
import 'package:diraction/views/products_view.dart';
import 'package:diraction/views/second_screen.dart';
import 'package:diraction/views/weather_homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.white,
    home: WeatherHomepage(),
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => FirstScreen(),
    //   '/second': (context) => SecondScreen("Taaha"),
    //   // '/third': (context) => ThirdScreen()
    // },
  ));
}
