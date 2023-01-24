import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(
      json.decode(str).map(
            (x) => Event.fromJson(x),
          ),
    );

String eventToJson(List<Event> data) => json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class Event {
  Event({
    required this.totalCollection,
  });

  String totalCollection;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        totalCollection: json["total_collection"],
      );

  Map<String, dynamic> toJson() => {
        "total_collection": totalCollection,
      };
}

// // To parse this JSON data, do

// //
// //     final event = eventFromJson(jsonString);

// import 'dart:convert';

// Event eventFromJson(String str) => Event.fromJson(json.decode(str));

// String eventToJson(Event data) => json.encode(data.toJson());

List<User> userFromJson(String str) => List<User>.from(
      json.decode(str).map(
            (x) => Event.fromJson(x),
          ),
    );

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
        marathon: Map.from(json["marathon"])
            .map((k, v) => MapEntry<String, Marathon>(k, Marathon.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user.toJson(),
        "token": token,
        "marathon": Map.from(marathon)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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
        date: DateTime.parse(json["date"]),
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

class Userdetail {
  String userName;
  String password;

  Userdetail({
    required this.userName,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        "username": userName,
        "password": password,
      };
}


//  

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         userid: json["userid"],
//         name: json["name"],
//         email: json["email"],
//         notificationStatus: json["notification_status"],
//       );

// 
