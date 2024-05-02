import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedIn extends StatelessWidget {
  UserCredential credential;
  LoggedIn(this.credential, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(credential.user!.email ?? "No email added"),
      ),
    );
  }
}
