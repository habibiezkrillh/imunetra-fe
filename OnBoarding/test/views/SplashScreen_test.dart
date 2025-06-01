import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imunetra/bloc/Splashscreen_bloc.dart';
import 'package:imunetra/Views/SplashScreen.dart';

// --- Mock Classes ---

class MockSplashBloc extends Mock implements SplashBloc {}

class FakeSplashEvent extends Fake implements SplashEvent {}

class FakeSplashState extends Fake implements SplashState {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  late MockSplashBloc mockBloc;
  late MockNavigatorObserver mockObserver;

  setUpAll(() {
    registerFallbackValue(FakeSplashEvent());
    registerFallbackValue(FakeSplashState());
    registerFallbackValue(FakeRoute()); // fallback untuk Route<dynamic>
  });

  setUp(() {
    mockBloc = MockSplashBloc();
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('navigates to OnboardingPage when isCompleted is true',
      (WidgetTester tester) async {
    // State awal (belum complete)
    when(() => mockBloc.state).thenReturn(
       SplashState(opacity: 1.0, isCompleted: false),
    );

    // Simulasikan aliran state sampai complete
    whenListen(
      mockBloc,
      Stream.fromIterable([
         SplashState(opacity: 1.0, isCompleted: false),
         SplashState(opacity: 1.0, isCompleted: true),
      ]),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SplashBloc>.value(
          value: mockBloc,
          child: SplashView(),
        ),
        navigatorObservers: [mockObserver], // Pasang navigator observer
      ),
    );

    await tester.pump(); // bangun widget pertama
    await tester.pump(const Duration(seconds: 2)); // tunggu animasi opacity
    await tester.pumpAndSettle(); // biarkan semua animasi dan navigasi selesai

    // Verifikasi bahwa navigator mendorong halaman onboarding
    verify(() => mockObserver.didPush(any(), any())).called(greaterThan(0));
  });
}
