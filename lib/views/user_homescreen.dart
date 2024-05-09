import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diraction/views/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                final dataList = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          profileImageUrl: dataList[index]
                                              ['imageUrl'],
                                          name: dataList[index]['name'],
                                          age: dataList[index]['age'],
                                          username: dataList[index]['username'],
                                        )));
                          },
                          leading: Container(
                            width:
                                (MediaQuery.of(context).size.width - 50) / 10,
                            child: CircleAvatar(
                              child: Image.network(dataList[index]['imageUrl']),
                            ),
                          ),
                          title: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 6,
                              child: Column(
                                children: [
                                  Text(dataList[index]['name']),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      "Subcricber Count: ${dataList[index]['subscribers']}"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  dataList[index]['uid'] !=
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? IconButton(
                                          onPressed: () async {
                                            int newsubcsribercount =
                                                dataList[index]['subscribers'];
                                            newsubcsribercount++;

                                            await FirebaseFirestore.instance
                                                .collection("Users")
                                                .doc(dataList[index]['uid'])
                                                .set({
                                              "subscribers": newsubcsribercount
                                            }, SetOptions(merge: true));
                                          },
                                          icon: Icon(Icons.plus_one))
                                      : SizedBox()
                                ],
                              )),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
