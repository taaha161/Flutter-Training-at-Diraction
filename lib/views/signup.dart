import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diraction/views/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final emaailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: usernameController,
          ),
          TextField(
            controller: ageController,
          ),
          TextField(
            controller: emaailController,
          ),
          TextField(
            obscureText: true,
            //obscuringCharacter: "?",
            controller: passwordController,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(onPressed: signUp, child: Text("REGISTER NOW")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIN()));
              },
              child: Text("Go To Sign In"))
        ],
      ),
    );
  }

  void signUp() async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emaailController.text, password: passwordController.text);

      await FirebaseFirestore.instance.collection("Users").add({
        "name": nameController.text,
        "username": usernameController.text,
        "age": ageController.text
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
