import 'package:diraction/button1.dart';
import 'package:diraction/button2.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  String value = "I am not presed yet";
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button1(widget.value),
        SizedBox(
          height: 20,
        ),
        Button2(changeText)
      ],
    );
  }

  void changeText() {
    setState(() {
      widget.value = "I am now pressed";
    });
  }
}
