import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diraction/views/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? _imgFile;
  String? profilePictureUrl;
  final emaailController = TextEditingController();

  final passwordController = TextEditingController();

  final usernameController = TextEditingController();

  final nameController = TextEditingController();

  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Name")),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Username")),
            controller: usernameController,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Age")),
            controller: ageController,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Email")),
            controller: emaailController,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Password")),
            obscureText: true,
            //obscuringCharacter: "?",
            controller: passwordController,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () async {
                await uploadProfile();
              },
              child: Text("Upload Profile Picture")),
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
      if (FirebaseAuth.instance.currentUser == null) {
        log("User is not signed in");
        return;
      }
      if (_imgFile == null) {
        log("Uploading an image is required");
        return;
      }
      if (profilePictureUrl == null) {
        log("User's image not uploaded");
      }
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emaailController.text, password: passwordController.text);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(credential.user!.uid)
          .set({
        "name": nameController.text,
        "username": usernameController.text,
        "age": ageController.text,
        "imageUrl": profilePictureUrl,
        "uid": credential.user!.uid
      }, SetOptions(merge: true));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadProfile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
      // maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      _imgFile = File(img.path); // convert it to a Dart:io file
    });
    print(img.path);

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_images/${usernameController.text}.jpg');
    try {
      final upload = storageRef.putFile(_imgFile!);
      final snaphot = await upload.whenComplete(() {
        print("Image uploaded");
      });
      final downloadUrl = await snaphot.ref.getDownloadURL();

      setState(() {
        profilePictureUrl = downloadUrl;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
