//
import 'package:flutter/material.dart';
import 'health.dart';
import 'home_screen.dart';

//
class Profile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;

  const Profile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final name = user.displayname;
    final url = user.photoUrl;
    // final url=user.based
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: url != null ? NetworkImage(url) : null,
            ),
          ),
          IconButton(
            onPressed: () async {
              await GoogleSignInApi.logout();
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const HomeScreen()),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                // _hasPermission();
              },
              child: const Text("click")),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const HealthData()),
                ),
              );
            },
            child: const Text("total step"),
          )),
        ],
      ),
    );
  }

  // void _hasPermission() async {
  //   final result = await Fitness.hasPermission();
  //   print(result);
  // }

}
