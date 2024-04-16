import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatefulWidget {
  final name;
  Counter(this.name);

  @override
  State<Counter> createState() => _CounterState(name);
}

class _CounterState extends State<Counter> {
  final name;
  var counter = 0;
  IconData Icon1 = Icons.abc;

  @override
  void initState() {
    super.initState();

    //Code before widget state is created
  }

  _CounterState(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${name}'),
            SizedBox(
              width: 50,
            ),
            Icon(Icon1)
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Icon(
              Icons.plus_one,
              color: Colors.white,
            )),
        onPressed: changeIcon1,
      ),
    );
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  void changeIcon1() {
    setState(() {
      Icon1 = Icons.access_alarm_sharp;
    });
  }

  @override
  void didChangeDependencies() {
    // Code when widget state change
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Code for before widget is destroyed
    super.dispose();
  }
}
