import 'package:diraction/views/loggedIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignIN extends StatelessWidget {
  final emaailController = TextEditingController();
  final passwordController = TextEditingController();
  SignIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emaailController,
          ),
          TextField(
            //obscureText: true,
            //obscuringCharacter: "?",
            controller: passwordController,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () async {
                signIn(context);
              },
              child: Text("Login NOW"))
        ],
      ),
    );
  }

  void signIn(context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emaailController.text, password: passwordController.text);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoggedIn(credential)));
    } catch (e) {
      print(e.toString());
    }
  }
}
