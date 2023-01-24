import 'package:fitness_app/pages/Auth/login_page.dart';
import 'package:fitness_app/pages/home/home.dart';
import 'package:fitness_app/widgets/show.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const ShowDats(),
      },
      initialRoute: '/',
    );
  }
}
///////////////////////////////////////////////////////////////////////////////

