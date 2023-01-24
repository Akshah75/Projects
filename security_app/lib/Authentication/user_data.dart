import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  int? id;
  int? usertype;
  String? name;
  String? email;
  String? password;
  String? token;

  User({
    this.id,
    this.usertype,
    this.name,
    this.email,
    this.password,
    // this.address,
    this.token,
  });
  ///////////////////////////////////////
  //Function to connect json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      usertype: json['user']['user_type'],
      name: json['user']['name'],
      email: json['user']['email'],
      password: json['user']['password'],
      token: json['token'],
    );
  }
}
