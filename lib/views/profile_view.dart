import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diraction/views/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile(
      {this.profileImageUrl, this.name, this.age, this.username, super.key});

  String? profileImageUrl;
  String? name;
  String? age;
  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                try {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIN()));
                } catch (e) {
                  log(e.toString());
                }
              },
              child: Text("Logout"))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.network(profileImageUrl!),
          ),
          SizedBox(
            height: 5,
          ),
          Text(name!),
          SizedBox(
            height: 5,
          ),
          Text(age!),
          SizedBox(
            height: 5,
          ),
          Text(username!)
        ],
      )),
    );
  }
}
