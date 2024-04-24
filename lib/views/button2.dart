import 'package:flutter/material.dart';

class Button2 extends StatefulWidget {
  final VoidCallback pressed;

  Button2(this.pressed, {super.key});

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.pressed, child: Text("Click me to change button 1"));
  }
}
