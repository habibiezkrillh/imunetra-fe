import 'dart:async';

class SplashService {
  Future<void> waitForSplashDuration() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> startFadeInAnimation(Function updateOpacity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    updateOpacity();
  }
}
