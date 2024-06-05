import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diraction/models/task.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/services.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int taskIndex = 0;

  Future<void> addTask() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Center(
              child: Container(
                height: 200,
                width: 300,
                color: Colors.yellow[700],
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: "Enter Title"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          InputDecoration(labelText: "Enter Description"),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              Task task = Task(
                                  id: taskIndex.toString(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  dateToBeCompleted: Timestamp.now());

                              await submitData(task);

                              titleController.clear();
                              descriptionController.clear();

                              Navigator.pop(context);
                            },
                            child: Text("Add Task")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> submitData(Task obj) async {
    final data = obj.toJson();

    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(taskIndex.toString())
        .set(data, SetOptions(merge: true));
    taskIndex++;
  }

  Future<void> updateData(Task obj) async {
    obj.title = titleController.text;
    obj.description = descriptionController.text;
    final data = obj.toJson();

    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(obj.id)
        .set(data, SetOptions(merge: true));
  }

  Future<void> deleteData(String id) async {
    await FirebaseFirestore.instance.collection("Tasks").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addTask();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
      ),
      body: FirestoreQueryBuilder(
        pageSize: 10,
        query: FirebaseFirestore.instance.collection("Tasks"),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.isFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.isFetchingMore) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.docs[index].data();
                  final Task task = Task.fromJson(data);

                  if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                    snapshot.fetchMore();
                    return CircularProgressIndicator();
                  } else {
                    return ListTile(
                      onTap: () async {
                        await editTask(task);
                      },
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await deleteData(task.id);
                        },
                      ),
                    );
                  }
                });
          }
        },
      ),
    );
  }

  Future<void> editTask(Task task) async {
    titleController.text = task.title;
    descriptionController.text = task.description;
    await showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Center(
              child: Container(
                height: 200,
                width: 300,
                color: Colors.yellow[700],
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: "Enter Title"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          InputDecoration(labelText: "Enter Description"),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await updateData(task);

                              titleController.clear();
                              descriptionController.clear();

                              Navigator.pop(context);
                            },
                            child: Text("Update Task")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
