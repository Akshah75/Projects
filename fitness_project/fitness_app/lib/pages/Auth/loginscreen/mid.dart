import 'dart:convert';

import 'package:fitness_app/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../bloc/api.dart';
import 'package:http/http.dart' as http;

class LoginMiddle extends StatefulWidget {
  const LoginMiddle({Key? key}) : super(key: key);

  @override
  State<LoginMiddle> createState() => _LoginMiddleState();
}

class _LoginMiddleState extends State<LoginMiddle> {
  Future<void>? launched;
  final url = Uri.parse(
      "https://www.strava.com/oauth/mobile/authorize?client_id=95381&redirect_uri=http://localhost&response_type=code&approval_prompt=auto&scope=activity:write,activity:read_all,profile:read_all,profile:write");
//  final url = Uri.parse(urls);
//
  Future<void> browser(url) async {
    if (await canLaunchUrl(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{"header_key": "header_value"},
      );
    } else {
      print("something wrong");
    }
  }

  //
  // String? username;
  // String? url;
  //
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              // color: Colors.red,
              child: Stack(
                children: const [
                  Positioned(
                    top: 15,
                    left: 10,
                    child: Text(
                      "Log in With..",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.yellow,
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 5), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) {
                                  return HomePage();
                                }),
                              ),
                            );
                          });
                        },
                        child: const Text("Google Fit"),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 20,
                      child: ElevatedButton(
                        onPressed: (() => browser(url)),
                        child: const Text("Strava"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//https://www.strava.com/oauth/mobile/authorize?client_id=95381&response_type=code&redirect_uri=http://localhost/exchange_token&approval_prompt=force&scope=activity:read_all
//https://www.strava.com/oauth/mobile/authorize?client_id=95381&response_type=code&redirect_uri=http://localhost/approval_prompt=force&scope=activity:read_all

Future auth() async {
  print("work..");
  const urls =
      "https://www.strava.com/oauth/mobile/authorize?client_id=95381&redirect_uri=http://localhost&response_type=code&approval_prompt=auto&scope=activity:write,activity:read_all,profile:read_all,profile:write";
  // const urls =
  //     "https://www.strava.com/oauth/mobile/authorize?client_id=95381&response_type=code&redirect_uri=http://localhost/approval_prompt=auto&scope=activity:read_all";
  final url = Uri.parse(urls);
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    // body: {
    //   "client_id": "95381",
    //   "response_type": "code",
    //   "redirect_uri": "http://localhost",
    //   "approval_prompt": "auto",
    //   "scope": "activity:read_all"
    // },
  );
  print("work..${response.statusCode}");
  print(response);
  final result = jsonDecode(response.body);
  print(result);
}






  //
//   Future<void> getData2() async {
//     const token = "4239760b26e27f537b63af23d4e010f2d4c715a2";
//     const urls = "https://www.strava.com/api/v3/athlete/activities";
//     final url = Uri.parse(urls);
//     try {
//       final response = await http.get(url, headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       });
//       print(response);
//       final result = json.decode(response.body);
//       print(result);
//       //
//       // final name2 = result[0]["name"];
//       // final distances = result[0]["distance"];
//       // final movingTime = result[0]["moving_time"];
//       // setState(() {
//       //   name = name2;
//       //   distance = distances;
//       //   mTime = movingTime;
//       // });
//       // print(name);
//       // print(response);
//     } catch (error) {
//       throw (error);
//     }
//     //
//   }
//   //

//   Future signIn(username, url) async {
//     print("user");
//     final user = await GoogleSignInApi.login();
//     print(user);
//     setState(() {
//       username = user!.displayName;
//       url = user.photoUrl;
//     });
//   }
//   //http://www.strava.com/oauth/token?client_id=95381&client_secret=fdbf6c929bc2cee6f08fc327bc0512f0e2641b1b&refresh_token=058a81de367c0efc3d31ed55cc8faf8c95c96772&grant_type=refresh_token

//   Future strava() async {
//     const token = "4239760b26e27f537b63af23d4e010f2d4c715a2";
//     print("work");
//     const urls = "http://www.strava.com/oauth/token";
//     final url = Uri.parse(urls);

//     final response = await http.post(
//       url,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       },
//       body: jsonEncode({
//         'client_id': 95381,
//         'client_secret': 'fdbf6c929bc2cee6f08fc327bc0512f0e2641b1b',
//         'refresh_token': '058a81de367c0efc3d31ed55cc8faf8c95c96772',
//         'grant_type': 'refresh_token',
//       }),
//     );

//     print(response);
//     final result = response.body.toString();
//     print(result);
//     final res = jsonDecode(result.toString());
//     print(res);

//     // final result = json.decode(response.body.toString());
//   }

//   Future strava2() async {
//     print("work");
//     const urls = "http://www.strava.com/oauth/mobile/token";
//     final url = Uri.parse(urls);

//     final response = await http.post(
//       url,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json'
//       },
//       body: jsonEncode({
//         'client_id': 95381,
//         'client_secret': 'fdbf6c929bc2cee6f08fc327bc0512f0e2641b1b',
//         'code': '3f02ca6f57c5a0ee77aa6f0557a8b27c93db355e',
//         'grant_type': 'authorization_code',
//       }),
//     );
//     print(response.statusCode);

//     // final result = json.decode(response.body.toString());
//     // print(result);
//     // print(response.statusCode);

//     // final result = jsonDecode(response.body);
//     // print(result);
//   }

//   Future strava3() async {
//     const token = 'd308ded2e4ca2f95076b36b622ab30cdaf51a8fc';
//     print("work");
//     const urls = "https://www.strava.com/api/v3/activities";
//     final url = Uri.parse(urls);

//     final response = await http.post(
//       url,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       },
//       body: {
//         'name': "new run",
//         'type': 'run',
//         'sport_type': '',
//         'elapsed_time': '3',
//         "start_date_local": "2022-10-18"
//       },
//     );
//     print(response.statusCode);

//     final result = json.decode(response.body);
//     print(result);
//     // print(response.statusCode);

//     // final result = jsonDecode(response.body);
//     // print(result);
//   }
// }
// ///https://www.strava.com/api/v3/activities?name=cyc2&type=run&=run&sport_type&elapsed_time=3&start_date_local=2022-10-18
   
  

