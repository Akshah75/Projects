// ignore_for_file: deprecated_member_use, unnecessary_brace_in_string_interps
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:security_app/Authentication/login_data.dart';
import '../constent.dart';
import 'package:http/http.dart' as http;
import '../public_user/public_drawer.dart';
import 'changepassword.dart';
import '../profile/updateProfile.dart';

//
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);
  @override
  State<MyProfile> createState() => _MyProfileState();
  static const routeName = '/profile';
}

//
class _MyProfileState extends State<MyProfile> {
  // File? imageFile;
  File? image;
  String? imageData;
  final picker = ImagePicker();
  int? cases;
  String? token;
  //
  String? name;
  String? address;
  String? mobile;
  String? email;
  // ignore: prefer_typing_uninitialized_variables
  @override
  void initState() {
    super.initState();
    userdetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 400,
            height: 200,
            color: Colors.green.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(18),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(profileImage),
                      radius: 10,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$name',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Name :',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text('$name')
                  ],
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Address :',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Text("$address",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('mobile :',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Text('$mobile',
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Email : ',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Text('$email',
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: go,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Edit',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: gopassword,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Change password',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> userdetail() async {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}profile');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final responseData = jsonDecode(response.body);
    print(responseData);
    final name1 = responseData['data']["name"];
    print(name1);
    final email1 = responseData['data']["email"];
    final address1 = responseData['data']["address"];
    final mobile1 = responseData['data']["mobile"];
///////////////////////////////////////////////////////////////////////////////
    setState(() {
      name = name1;
      email = email1;
      address = address1;
      mobile = mobile1;
    });
  }

  // Future<void> profileDetail() async {
  //   String userName = await getname();
  //   String email = await getEmail();
  //   int userType = await getUserType();
  //   int mobile1 = await getmobile();
  //   print(mobile1);
  //   String address2 = await getAddress();

  //   print(mobile1);
  //   print(userType);
  //   setState(() {
  //     userName2 = userName;
  //     address = address2;
  //     emailId = email;
  //     mobile = mobile1;
  //   });
  // }
  //////////////////////////////////////////////////////////////
  Future<void> updateUserDetail() async {
    String token = await getToken();
    int id = await getId();
    print(id);
    final url = Uri.parse('${basedUrl}/updateprofile');
    print(url);
    final response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      "name": name,
      "username": "username",
      'mobile': mobile,
      "address": address,
    });
    final responseData = jsonDecode(response.body);
    print(responseData);
  }

  ///
  void go() {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: ((context) => const ChangePasswordScreen())));
    Navigator.of(context).pushNamed(ProfileUpdate.routeName);
  }

  void gopassword() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const ChangePasswordScreen())));
  }
}
