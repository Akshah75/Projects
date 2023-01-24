// ignore: file_titles

import 'dart:convert';

List<Activity> userFromJson(String str) => List<Activity>.from(
      jsonDecode(str).map(
        (x) => Activity.fromJson(x),
      ),
    );

class Activity {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Activity({this.userId, this.id, this.title, this.completed});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['userId'] = userId;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
