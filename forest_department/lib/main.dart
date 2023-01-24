import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/Authentication/register.dart';
import 'package:security_app/extra_widget/utils.dart';
import 'package:security_app/file_upload/selectedFile.dart';
import 'package:security_app/file_upload/upload_image.dart';
import 'package:security_app/finalwidget/complaints.dart';
import 'package:security_app/finalwidget/home.dart';
import 'package:security_app/provider/auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Firebase Auth';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messagerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.green,
          primaryColor: Colors.green,
          buttonTheme: ButtonTheme.of(context).copyWith(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: LoginUserPage(),
        routes: {
          UserRegister.routeName: ((context) => UserRegister()),
          LoginUserPage.routeName: ((context) => LoginUserPage()),
          HomeUserScreen.routeName: ((context) => HomeUserScreen()),
        },
      ),
    );
  }
}
