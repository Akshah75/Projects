import 'package:flutter/material.dart';
import 'package:security_app/finalwidget/mydrawer.dart';
import 'package:security_app/public_user/home.dart';

import '../constent.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = '/notificationPage';

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          Container(
              margin: const EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeUserScreen.routeName);
                },
              )),
        ],
      ),
      body: const Center(
        child: Text("You don't have any notification"),
      ),
    );
  }
}
