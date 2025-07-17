import 'package:flutter/material.dart';
import 'package:online_ordering_system/pages/profile.dart';
import 'pages/landingPage.dart';
import 'pages/ordernow.dart';
import 'pages/contactus.dart';
import 'pages/notifications.dart';
import 'package:online_ordering_system/auth/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LomiHub',
      debugShowCheckedModeBanner: false,
      initialRoute: '/landingpage',
      routes: {
        '/login': (context) => const Login(),
        '/landingpage': (context) => const Landingpage(),
        '/contactus': (context) => const ContactUs(),
        '/OrderNow': (context)   => const Ordernow(),
        '/notifications': (context) => const Notifications(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
