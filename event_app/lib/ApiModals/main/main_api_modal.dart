// To parse this JSON data, do
//
//     final eventData = eventDataFromJson(jsonString);

import 'dart:convert';

EventData eventDataFromJson(String str) => EventData.fromJson(json.decode(str));

String eventDataToJson(EventData data) => json.encode(data.toJson());

class EventData {
  EventData({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
    required this.marathon,
  });

  bool success;
  String message;
  User user;
  String token;
  Map<String, Marathon> marathon;

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
        marathon:
            //  Marathon.fromJson(json["marathon"])
            Map.from(json["marathon"]).map(
                (k, v) => MapEntry<String, Marathon>(k, Marathon.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user.toJson(),
        "token": token,
        "marathon": toJson(),
      };
}

class Marathon {
  Marathon({
    required this.id,
    required this.name,
    required this.date,
    required this.logo,
  });

  String id;
  String name;
  DateTime date;
  String logo;

  factory Marathon.fromJson(Map<String, dynamic> json) => Marathon(
        id: json["id"],
        name: json["name"],
        date: DateTime.parse(json['date'] as String),
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "logo": logo,
      };
}

class User {
  User({
    required this.userid,
    required this.name,
    required this.email,
    required this.notificationStatus,
  });

  String userid;
  String name;
  String email;
  String notificationStatus;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json["userid"],
        name: json["name"],
        email: json["email"],
        notificationStatus: json["notification_status"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "name": name,
        "email": email,
        "notification_status": notificationStatus,
      };
}
