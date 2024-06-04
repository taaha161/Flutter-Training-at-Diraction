import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String description;
  Timestamp dateToBeCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateToBeCompleted});

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        dateToBeCompleted: data['date']);
  }

  Map<String, dynamic> toJson() {
    final jsonData = {
      "id": id,
      "title": title,
      "description": description,
      "date": dateToBeCompleted
    };

    return jsonData;
  }
}
