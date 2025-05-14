import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imunetra/Views/OnBoarding.dart';
import 'package:imunetra/bloc/Splashscreen_bloc.dart';
import 'package:imunetra/utils/navigator_splash.dart';
import '../services/splash_service.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(SplashService())..add(StartSplash()),
      child: SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (prev, curr) => prev.isCompleted != curr.isCompleted,
      listener: (context, state) {
        if (state.isCompleted) {
          NavigatorHelper.navigateWithFade(context, OnboardingPage());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final titleFontSize = (constraints.maxWidth * 0.06).clamp(16.0, 32.0);
            final imageWidth = (constraints.maxWidth * 0.6).clamp(100.0, 300.0);

            return Center(
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  return AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: state.opacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          width: imageWidth,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
