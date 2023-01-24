import 'package:flutter/material.dart';
import 'package:security_app/Authentication/forget_password.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/Authentication/register.dart';
import 'package:security_app/profile/profile.dart';
import 'package:security_app/public_user/complaint_list_screen.dart';
import 'package:security_app/public_user/complaints.dart';
import 'package:security_app/public_user/home.dart';
import 'package:security_app/provider/auth.dart';
import 'package:provider/provider.dart';
import 'package:security_app/tec/add_provider.dart';
import 'SuperAdmin/file_show.dart';
import 'finalwidget/notification_page.dart';
import 'profile/updateProfile.dart';

Future main() async {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Firebase Auth';
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: Auth(),
            ),
            ChangeNotifierProvider.value(value: AddProvider()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              backgroundColor: Colors.green.shade400,
              primaryColor: Colors.green.shade400,
              buttonTheme: ButtonTheme.of(context).copyWith(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                  .copyWith(secondary: Colors.deepOrange),
            ),
            home: const LoginUserPage(),
            routes: {
              UserRegister.routeName: ((context) => const UserRegister()),
              LoginUserPage.routeName: ((context) => const LoginUserPage()),
              ForgetPassword.routeName: ((context) => const ForgetPassword()),
              HomeUserScreen.routeName: ((context) => const HomeUserScreen()),
              NotificationPage.routeName: ((context) =>
                  const NotificationPage()),
              MyProfile.routeName: (((context) => const MyProfile())),
              Complaints.routeName: (((context) => const Complaints())),
              ComplaintListScreen.routeName: (((context) =>
                  const ComplaintListScreen())),
              ProfileUpdate.routeName: ((context) => const ProfileUpdate()),
            },
          ),
        ),
      );
}
