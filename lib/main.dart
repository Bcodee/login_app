import 'package:flutter/material.dart';
import 'package:loginapp/screens/Login_page.dart';
import 'package:loginapp/screens/homescreen.dart';
import 'package:loginapp/screens/loginscreen1.dart';
import 'package:loginapp/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen1.routename,
      title: 'Login App',
      home: LoginScreen1(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        LoginScreen1.routename: (context) => LoginScreen1(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
    );
  }
}
