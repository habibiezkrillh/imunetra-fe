import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard_relawan/services/dashboard/api_service.dart';
import 'package:dashboard_relawan/views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DashboardService>(
      create: (_) => DashboardService(),
      child: MaterialApp(
        title: 'Dashboard Relawan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 14),
          ),
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
