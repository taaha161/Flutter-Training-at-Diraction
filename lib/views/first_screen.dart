import 'package:diraction/views/second_screen.dart';
import 'package:diraction/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(backgroundcolor: Colors.teal, title: "First Screen"),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    helperText: "This is helper text",
                    helperStyle: TextStyle(color: Colors.red),
                    icon: Icon(Icons.abc),
                    labelText: "Enter Your Name",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                controller: _nameController,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/second');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SecondScreen(_nameController.text);
                      }));
                    },
                    child: Text("Next Screen")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
