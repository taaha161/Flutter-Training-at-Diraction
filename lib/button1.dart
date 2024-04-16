import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  String value = "I am not pressed yet";
  Button1(this.value, {super.key});

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("${widget.value}"));
  }
}
