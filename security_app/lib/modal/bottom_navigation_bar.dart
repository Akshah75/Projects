// import 'package:flutter/material.dart';

// import '../finalwidget/main_page.dart';
// import '../finalwidget/notification_page.dart';
// import '../profile/profile.dart';

// //
// class BottomNavigationBar extends StatefulWidget {
//   const BottomNavigationBar({Key? key, required int currentIndex}) : super(key: key);

//   @override
//   State<BottomNavigationBar> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<BottomNavigationBar> {
//   int currentIndex = 0;
//   final screenNavigation = [
//     // HomeUserScreen(),
//     MainPage(),
//     const NotificationPage(),
//     const MyProfile(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
    
//               currentIndex: currentIndex,
//               onTap: (index) => setState(() {
//                     currentIndex = index;
//                   }),

//               //
//               iconSize: 24,
//               // selectedFontSize: 20,
//               // unselectedFontSize: 16,
//               showUnselectedLabels: false,
//               // showSelectedLabels: false,
//               unselectedItemColor: Colors.white70,
//               selectedItemColor: Colors.white,
//               backgroundColor: Colors.green,
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Dashbord',
//                   // backgroundColor: Colors.white),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.notifications),
//                   label: 'Notification',
//                   // backgroundColor: Colors.white),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',

//                   // backgroundColor: Colors.white),
//                 ),
//     );
//   }
// }
