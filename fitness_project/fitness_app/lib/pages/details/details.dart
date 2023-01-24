import 'package:flutter/material.dart';
import '../../screen/home_screen.dart';
import '../../widgets/bottom_navigation.dart';
import 'widgets/dates.dart';
import 'widgets/info.dart';
import 'widgets/stack.dart';
import 'widgets/steps.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Activity",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await GoogleSignInApi.logout();
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
              );
            },
            color: Colors.black,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: const [
          Dates(),
          Steps(),
          Info(),
          Stacks(),
          BottomNavigationBars(),
        ],
      ),
    );
  }
}
