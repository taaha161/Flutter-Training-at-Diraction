import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final name;
  SecondScreen(this.name, {super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newNameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              helperText: "This is helper text",
                              helperStyle: TextStyle(color: Colors.red),
                              icon: Icon(Icons.abc),
                              labelText: "Enter Your Name",
                              labelStyle: TextStyle(color: Colors.blue)),
                          textAlign: TextAlign.center,
                          controller: _newNameController,
                          validator: (value) {
                            if (!value!.contains("@")) {
                              return "Invalid Email Address";
                            }
                            // if (value!.length > 10) {
                            //   return "Name cannot exceed length of 10 characters";
                            // }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Next Screen")),
                        )
                      ],
                    ))
              ]),
        ),
      ),
    ));
  }
}
