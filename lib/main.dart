import 'package:diraction/button1.dart';
import 'package:diraction/counter.dart';
import 'package:diraction/first_screen.dart';
import 'package:diraction/mainscreen.dart';
import 'package:diraction/my_homepage.dart';
import 'package:diraction/products_view.dart';
import 'package:diraction/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.white,
    home: ProductsPage(),
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => FirstScreen(),
    //   '/second': (context) => SecondScreen("Taaha"),
    //   // '/third': (context) => ThirdScreen()
    // },
  ));
}
