// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:walkie_talki/models/message_model.dart';

// class ChatService extends ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<void> sendMessage({recieverID, message}) async {
//     final currentUserID = _firebaseAuth.currentUser!.uid;
//     final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
//     final Timestamp timestamp = Timestamp.now();

//     Message newMessage = Message(
//         senderID: currentUserID,
//         senderEmail: currentUserEmail,
//         recieverID: recieverID,
//         message: message,
//         timestamp: timestamp);
//     List<String> ids = [currentUserID, recieverID];
//     // userid=1, userId=2.  2-->1, 1-->2  == "1_2"
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     var userData;

//     final userDataRef = await _firestore
//         .collection("Users")
//         .doc(currentUserID)
//         .get()
//         .then((value) {
//       userData = value;
//     });

//     var otheruserData;

//     final otheruserDataRef = await _firestore
//         .collection("Users")
//         .doc(recieverID)
//         .get()
//         .then((value) {
//       otheruserData = value;
//     });

//     await _firestore
//         .collection("chat_rooms")
//         .doc(currentUserID)
//         .collection("chatRooms")
//         .doc(chatRoomId)
//         .collection("messages")
//         .add(newMessage.toMap());
//     await _firestore
//         .collection("chat_rooms")
//         .doc(currentUserID)
//         .collection("chatRooms")
//         .doc(chatRoomId)
//         .set({
//       "name": otheruserData['name'],
//       "photoUrl": otheruserData['photoUrl'],
//       "recieverUid": otheruserData['uid']
//     }, SetOptions(merge: true));

//     /// Second User
//     await _firestore
//         .collection("chat_rooms")
//         .doc(recieverID)
//         .collection("chatRooms")
//         .doc(chatRoomId)
//         .collection("messages")
//         .add(newMessage.toMap());

//     await _firestore
//         .collection("chat_rooms")
//         .doc(recieverID)
//         .collection("chatRooms")
//         .doc(chatRoomId)
//         .set({
//       "name": userData['name'],
//       "photoUrl": userData['photoUrl'],
//       "recieverUid": userData['uid']
//     }, SetOptions(merge: true));
//   }

//   Stream<QuerySnapshot> getMessages({userID, otherUserID}) {
//     // 2,1
//     // 1_2
//     List<String> id = [userID, otherUserID];
//     id.sort();
//     final roomID = id.join("_");
//     return _firestore
//         .collection("chat_rooms")
//         .doc(userID)
//         .collection("chatRooms")
//         .doc(roomID)
//         .collection("messages")
//         .orderBy("timestamp", descending: false)
//         .snapshots();
//   }
// }
