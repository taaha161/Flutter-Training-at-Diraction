import 'package:diraction/views/counter.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage();
  var name = "Hello World";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Counter(name);
                }));
              }),
          appBar: AppBar(
            elevation: 3,
            shadowColor: Color(0xFF123456),
            backgroundColor: Colors.amber,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Counter(name);
                  }));
                },
                icon: Icon(
                  Icons.arrow_back,
                )),
            title: Text("My First App"),
          ),
          body: Center(
              child: Text(
            name,
            style: TextStyle(fontSize: 24),
          ))),
    );
  }

  void changeName() {
    name = "Hello another world";
    print("The name has now changed to ${name}");
  }
}
