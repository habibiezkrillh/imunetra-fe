import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'routes/router.dart';
import 'utils/theme.dart';
import 'bloc/chat_bloc.dart'; // Import bloc yang diperlukan

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(create: (_) => ChatBloc()),
        // Tambahkan Bloc lainnya di sini
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Mematikan debug banner yang pakbal
      title: 'Chat App',
      theme: AppTheme.lightTheme,
      routerConfig: router, // go_router (Ada di file routes/router.dart)
    );
  }
}
