
import 'package:finalproject/pages/interDetails.dart';
import 'package:finalproject/auth/login.dart';
import 'package:finalproject/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splachScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/photo': (context) => SplashScreenPage(), // Add the intermediate page route
        '/home': (context) => MetroTicketReservation(),
      },
    );
  }
}
