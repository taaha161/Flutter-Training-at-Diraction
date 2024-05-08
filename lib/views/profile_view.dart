import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final auth = FirebaseAuth.instance;
  final databaseRef = FirebaseFirestore.instance;
  String profileImageUrl = "";
  String name = "";
  String age = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.network(profileImageUrl),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(name),
                    SizedBox(
                      height: 5,
                    ),
                    Text(age),
                    SizedBox(
                      height: 5,
                    ),
                    Text(username)
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<void> fetchData() async {
    final uid = auth.currentUser!.uid;
    final snapshot = await databaseRef
        .collection("Users")
        .where("uid", isEqualTo: uid)
        .get();
    profileImageUrl = snapshot.docs[0]['imageUrl'];
    name = snapshot.docs[0]['name'];
    age = snapshot.docs[0]['age'];
    username = snapshot.docs[0]['username'];
  }
}
