import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imunetra/views/ProfileScreen.dart';
import 'bloc/profile_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ProfileCubit(),
      child: MaterialApp(
        home: ProfileScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
