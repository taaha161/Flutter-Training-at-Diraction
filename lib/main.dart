import 'package:diraction/views/button1.dart';
import 'package:diraction/views/counter.dart';
import 'package:diraction/views/first_screen.dart';
import 'package:diraction/views/mainscreen.dart';
import 'package:diraction/views/my_homepage.dart';
import 'package:diraction/views/products_view.dart';
import 'package:diraction/views/second_screen.dart';
import 'package:diraction/views/signup.dart';
import 'package:diraction/views/weather_homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(color: Colors.white, home: SignUp()

      //WeatherHomepage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstScreen(),
      //   '/second': (context) => SecondScreen("Taaha"),
      //   // '/third': (context) => ThirdScreen()
      // },
      ));
}
