import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../constent.dart';
import 'package:http/http.dart ' as http;
import '../provider/auth.dart';
import 'package:provider/provider.dart';

class DashbordData with ChangeNotifier {
  Future<void> superAdmindata() async {
    print('working?');
    final url = Uri.parse(basedUrl + 'dashbord');
    final response = await http.get(url, headers: {
      'accept': 'application/json',
      // 'Authorization': 'Bearer ${token}'
    });
    final responseData = jsonDecode(response.body);
    print(responseData);
    // notifyListeners();
  }
}
