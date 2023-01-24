import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:security_app/provider/complaint_data_modal.dart';

import '../constent.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import '../Authentication/login_data.dart';

// import 'package:'

class Auth with ChangeNotifier {
  String? token;
  String? userName;
  String? emailId;
  String? mobile;
  String? address;
  int? id;
  Timer? authTimer;
  int? usertype;
  int? totaluser;
  int? totalDepartment;
  int? totalCase;
  double? latitude;
  String? nature;
  String? allot;
  String? fname;
  String? firstName;
  List<File>? files;
  // Map owner = {};
  Map owner = {};

  //for singup user

  Future<void> singup(String name, String mobile, String address, String email,
      String password, String confirmPassword) async {
    final url = Uri.parse("${basedUrl}register");
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: jsonEncode({
        "name": name,
        "mobile": mobile,
        "email": email,
        "address": address,
        "password": password,
        "password_confirmation": confirmPassword,
      }),
    );
    // ignore: avoid_print
    print('ok');
    // ignore: avoid_print
    print(response.body);

    //
    switch (response.statusCode) {
      case 200:
        print('register Succesfull');
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        break;
    }
    notifyListeners();
  }

  //
  Future<void> fetchData() async {
    final url = Uri.parse(basedUrl + 'register');
    try {
      final response = await http.get(url);
      final decode = json.decode(response.body) as Map<String, dynamic>;
      print(decode);
      print(response);
    } catch (error) {
      throw (error);
    }
    notifyListeners();
  }

// login user
  Future<void> login(String email, String password) async {
    print('ok');
    final url = Uri.parse('${basedUrl}login');
    print(url);
    try {
      final response = await http.post(url,
          body: {"email": email, "password": password},
          headers: {'accept': "application/json"});
      print(jsonDecode(response.body));
      //
      final responseData = jsonDecode(response.body);
      token = responseData['token'];
      userName = responseData['user']['name'];
      emailId = responseData['user']['email'];
      address = responseData['user']['address'];
      mobile = responseData['user']['mobile'];

      usertype = responseData['user']['user_type'];

      print(usertype);

      print(emailId);
      print(userName);

      print(token);
      //
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      // autoLogout();
      notifyListeners();
      //
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

//google login user
  Future<void> googleLogin() async {
    // ignore: avoid_print
    print('goole loging success');
    GoogleSignIn gooleSignIn = GoogleSignIn();
    try {
      final result = await gooleSignIn.signIn();
      // ignore: avoid_print
      print(result);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
    notifyListeners();
  }

  //
  Future<void> getin() async {
    final res = await http.get(Uri.parse('$basedUrl/testing'), headers: {
      'Accept': 'application/json',
    });
    print(res.body);
    notifyListeners();
  }

//logout user
  Future<void> logout() async {
    print('wori');
    String token = await getToken();
    String userName = await getname();
    final response = await http.post(Uri.parse("${basedUrl}logout"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(token);
    print(userName);
    token = ' ';
    if (authTimer != null) {
      authTimer!.cancel();
      authTimer = null;
    }
    print("tokan $token");
    print(response.body);
    notifyListeners();
  }

  // auto logout
  void autoLogout() {
    // final timeToExpiry=_expiryDate.difference(DateTime.now()).inSeconds
    if (authTimer != null) {
      authTimer!.cancel();
    }

    authTimer = Timer(const Duration(seconds: 2), logout);
    notifyListeners();
  }

  //
  Future<void> dashbordData() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}dashboard');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final responseData = jsonDecode(response.body);
    print(responseData);

    totalCase = responseData['data']['caseCount'];
    print(totalCase);
    // print(totalCase);
  }
  //
  //

  Future<void> complaint() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint');
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    List<GetComplaintData> complain = [];
    final resData = (jsonDecode(res.body));
    resData['data'].forEach((res) {
      GetComplaintData.fromJson(res);

      print("work");
      complain.add(res["id"]);
      // print(res);
      print(res);
    });
    print(complain);
    // print(nature);

    // // final name;
    // final resData = jsonDecode(res.body);
    // print(nature);

    //

    // List resp = responseData['data'];

    // print(resp);
    // print(responseData);

    // List<UserComplaintData> userComplaint = responseData;
    // print("work");
    // print(userComplaint);
    // nature = responseData['data'][0]['nature'];
    // firstName = responseData['data'][4]['firstname'];

    // print(nature);
  }

  //
  Future<void> postComplaint(
    String ns,
    String district,
    String taluka,
    String landmark,
    int owner,
    int cts,
    int surveyno,
    double latitude,
    double longitude,
    String description,
    String fname,
    String lName,
    int mobile,
    String address,
    List<File> newFile,
  ) async {
    print("working?");
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };

    final res = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        'nature': ns,
        'district': district,
        'taluka': taluka,
        'landmark': landmark,
        'ownership_type': owner,
        'cts_no': cts,
        'survey_no': surveyno,
        'latitude': latitude,
        'longitude': longitude,
        'description': description,
        'firstname': fname,
        'lastname': lName,
        'primarycontact': mobile,
        'address': address,
        'complaintfile[]': files,
      }),
    );

    print(res.body);
  }

  //
  Future<void> fileupload(File image) async {
    print("working??");
    final url = basedUrl + 'testing';
    print(url);
    final stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    final length = await image.length();
    Map<String, String> headers = {
      'Accept': 'applicatin/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var multipartFileSign = http.MultipartFile('file', stream, length,
        filename: basename(image.path));
    //
    request.files.add(multipartFileSign);
    final res = await request.send();
    res.stream.transform(utf8.decoder).listen((event) {
      print(event);
    });
  }

  ///
  Future<void> getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    latitude = locData.latitude;
    print(latitude);

    // print(locData.latitude);
    // longitude = locData.longitude;

    // print(latitude);
    // print(longitude);
  }
}
