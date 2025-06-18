import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigatiobar/views/chat.dart';
import 'package:navigatiobar/views/home.dart';
import 'package:navigatiobar/views/profile.dart';
import 'package:navigatiobar/views/riwayat.dart';
import 'views/navigationbar.dart';


void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomNavBar(location: state.uri.toString()),
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, _) =>  HomePage()),
        GoRoute(path: '/chat', builder: (context, _) =>  chatPage()),
        GoRoute(path: '/riwayat', builder: (context, _) =>  RiwayatPage()),
        GoRoute(path: '/profile', builder: (context, _) =>  ProfilePage()),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
