import 'package:dashboard/bloc/reminder_card/reminder_bloc.dart';
import 'package:dashboard/services/dashboard/api_service.dart';
import 'package:dashboard/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DashboardService>(create: (_) => DashboardService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ReminderBloc>(create: (_) => ReminderBloc()),
        ],
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
      ),
    );
  }
}
