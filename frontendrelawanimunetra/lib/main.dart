import 'package:flutter/material.dart';
import 'package:frontendtenagamedisimunetra/views/dashboard.dart';
import 'package:frontendtenagamedisimunetra/views/login.dart';
import 'package:frontendtenagamedisimunetra/views/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Register Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  DashboardPage(),
        '/register': (context) => const RegisterView(),
        '/dashboard':(context)=>  DashboardPage(),
      },
    );
  }
}
