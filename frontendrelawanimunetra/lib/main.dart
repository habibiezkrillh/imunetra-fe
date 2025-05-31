import 'package:flutter/material.dart';
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
        '/': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
      },
    );
  }
}
