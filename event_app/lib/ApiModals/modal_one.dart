import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//
const basedUrl = "https://jsonplaceholder.typicode.com/todos";
// const basedUrl = "https://jsonplaceholder.ir/users";

class BaseClient {
  final client = http.Client();

  ///
  Future<dynamic> get() async {
    final url = Uri.parse(basedUrl);
    final headers = {'Content-Type': 'Application/json'};
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      debugPrint("somethin went wrong");
    }

    // if (response.statusCode == 200) {
    //   return Activity.fromJson(jsonDecode(response.body));
    // } else {
    //   print("something wrong");
    // }
    // return Activity();
  }

  Future<dynamic> post(dynamic object) async {
    final url = Uri.parse(basedUrl);
    final payload = jsonEncode(object);
    final headers = {'Content-Type': 'Application/json'};

    final response = await client.post(url, headers: headers, body: payload);

    return response.body;
    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   print("something wrong");
    // }
  }
}
