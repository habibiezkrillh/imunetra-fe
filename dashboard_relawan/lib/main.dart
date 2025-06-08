import 'package:dashboard_relawan/views/dashboard.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imunetra POV Relawan',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  DashboardPage(userName: 'Aurelia', profileImageUrl: '',),
      },
    );
  }
}
