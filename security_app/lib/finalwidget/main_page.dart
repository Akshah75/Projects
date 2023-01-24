import 'package:flutter/material.dart';
import 'package:security_app/finalwidget/notification_page.dart';
import '../public_user/public_drawer.dart';
import '../constent.dart';
import '../public_user/public_user_dashbord.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashbord'),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NotificationPage.routeName);
              },
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      drawer: const PublicDrawer(),
      body: const PublicUserDashbord(),
    );
  }
}
