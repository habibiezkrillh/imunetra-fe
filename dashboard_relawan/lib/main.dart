import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/dashboard/dashboard_bloc.dart';
import 'repository/dashboard_repo.dart';
import 'views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => DashboardRepo(DashboardService()),
      child: BlocProvider(
        create: (context) =>
            DashboardBloc(RepositoryProvider.of<DashboardRepo>(context))
              ..add(LoadActivities()),
        child: MaterialApp(
          title: 'Imunetra POV Relawan',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const DashboardPage(),
          },
        ),
      ),
    );
  }
}
