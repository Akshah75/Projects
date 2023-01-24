import 'package:flutter/material.dart';

import '../../../bloc/api.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  String? username;
  String? url;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              onPressed: () {
                print("work");
                logout();
                Future.delayed(const Duration(seconds: 2), () async {
                  Navigator.of(context).pushNamed('/');
                });
              },
              icon: const Icon(Icons.menu, color: Colors.white),
            ),
          ),
          Positioned(
            top: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                minRadius: 25,
                maxRadius: 25,
                backgroundImage: url != null ? NetworkImage("$url") : null,
              ),
            ),
          ),
          Positioned(
            left: 33,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                username != null
                    ? const Text(
                        "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future logout() async {
    await GoogleSignInApi.logout();
  }
}
