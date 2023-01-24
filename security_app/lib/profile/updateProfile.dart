// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import '../Authentication/login_data.dart';
import '../splashScreen/loading.dart';

//
class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
  static const routeName = '/updateProfile';
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  String? name;
  String? mobile;
  String? address;
  final nameController = TextEditingController();
  final emailContrller = TextEditingController();
  final mobileContrller = TextEditingController();
  final addressContrller = TextEditingController();

  @override
  void initState() {
    getProfile();
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      nameController.text = "$name";
      mobileContrller.text = "$mobile";
      addressContrller.text = "$address";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Profile")),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 100,
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      // autofocus: false,
                      // initialValue: "$name",
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: mobileContrller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Mobile",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: addressContrller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: "Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              // loadingIndicator(context);
                              updatedProfile();
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )),
                        RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updatedProfile() async {
    String token = await getToken();
    print(token);
    final response = await http.post(Uri.parse('${basedUrl}profile'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      "name": nameController.text,
      "mobile": mobileContrller.text,
      "email": emailContrller.text,
      "address": addressContrller.text
    });
    switch (response.statusCode) {
      case 200:
        print(response.body);
        final profileUpdate = jsonDecode(response.body)['message'];
        showSuccesMessage(profileUpdate);
        break;
      default:
        final errorMessage = "Something went wrong";
        errorMessageShow(errorMessage);

        break;
    }
  }

/////////////////////////////message show////////////////////////
  void showSuccesMessage(error) {
    final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            '$error',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ////////////////////////////////////////////////////////////////
  void errorMessageShow(error) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          '$error',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

////////////////////////////////////////////////////////////////////////////
  void loadingIndicator(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoadingIndicator(),
      ),
    );
  }

  Future<void> getProfile() async {
    String token = await getToken();
    print(token);
    final response = await http.get(
      Uri.parse('${basedUrl}profile'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    print(response.body);
    name = jsonDecode(response.body)["data"]["name"];
    address = jsonDecode(response.body)["data"]["address"];
    mobile = jsonDecode(response.body)["data"]["mobile"];
    print(name);

    // switch (response.statusCode) {
    //   case 200:
    //     print(response.body);
    //     final profileUpdate = jsonDecode(response.body)['message'];
    //     showSuccesMessage(profileUpdate);
    //     break;
    //   default:
    //     final errorMessage = "Something went wrong";
    //     errorMessageShow(errorMessage);

    //     break;
    // }
  }
}
