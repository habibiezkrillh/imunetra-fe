import 'package:flutter/material.dart';

class NavigatorHelper {
  static void navigateWithFade(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => page,
        transitionsBuilder: (_, animation, __, child) {
          final fade = Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: Curves.easeInOut))
              .animate(animation);
          return FadeTransition(opacity: fade, child: child);
        },
      ),
    );
  }
}
