import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/splash_service.dart';

abstract class SplashEvent {}

class StartSplash extends SplashEvent {}

class SplashState {
  final double opacity;
  final bool isCompleted;

  SplashState({required this.opacity, required this.isCompleted});

  SplashState copyWith({double? opacity, bool? isCompleted}) {
    return SplashState(
      opacity: opacity ?? this.opacity,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashService _splashService;

  SplashBloc(this._splashService)
      : super(SplashState(opacity: 0.0, isCompleted: false)) {
    on<StartSplash>((event, emit) async {
      await _splashService.startFadeInAnimation(() {
        emit(state.copyWith(opacity: 1.0));
      });

      await _splashService.waitForSplashDuration();
      emit(state.copyWith(isCompleted: true));
    });
  }
}
