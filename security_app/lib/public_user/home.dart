import 'package:flutter/material.dart';
import 'package:security_app/provider/dashbord_data.dart';
import '../profile/profile.dart';
import '../finalwidget/main_page.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
  static const routeName = '/homepage';
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  int currentIndex = 0;

  final screenNavigation = [
    MainPage(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          print('Back Button Pressed');
          return false;
        },
        child: Scaffold(
          body: screenNavigation[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() {
                    currentIndex = index;
                  }),

              //
              iconSize: 24,
              // selectedFontSize: 20,
              // unselectedFontSize: 16,
              showUnselectedLabels: false,
              // showSelectedLabels: false,
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.green,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Dashbord',
                  // backgroundColor: Colors.white),
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.notifications),
                //   label: 'Notification',
                //   // backgroundColor: Colors.white),
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',

                  // backgroundColor: Colors.white),
                ),
              ]),
        ),
      );
}

  // Future<void> logOut() async {
  //   await Provider.of<Auth>(context, listen: false).logout();
  // }

