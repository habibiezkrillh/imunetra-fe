import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imunetra/views/OnBoarding.dart';

void main() {
  group('OnboardingPage Widget Test', () {
    testWidgets('Menampilkan halaman pertama dengan elemen penting', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingPage()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title')), findsOneWidget);
      expect(find.byKey(Key('onboarding_image')), findsOneWidget);
      expect(find.byKey(Key('description')), findsOneWidget);
      expect(find.byKey(Key('lewati_button')), findsOneWidget);
      expect(find.byKey(Key('lanjut_button')), findsOneWidget);
    });

    testWidgets('Mengklik tombol Lanjut berpindah halaman', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingPage()));
      await tester.pumpAndSettle();

      final lanjutButton = find.byKey(Key('lanjut_button'));
      expect(lanjutButton, findsOneWidget);

      await tester.tap(lanjutButton);
      await tester.pumpAndSettle();

      // Harusnya pindah halaman, deskripsi berubah
      expect(find.byKey(Key('description')), findsOneWidget);
    });

    testWidgets('Klik tombol Lewati membawa ke halaman terakhir', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingPage()));
      await tester.pumpAndSettle();

      final lewatiButton = find.byKey(Key('lewati_button'));
      expect(lewatiButton, findsOneWidget);

      await tester.tap(lewatiButton);
      await tester.pumpAndSettle();

      final mulaiSekarangButton = find.byKey(Key('mulai_sekarang_button'));
      expect(mulaiSekarangButton, findsOneWidget);
    });

    testWidgets('Tombol Mulai Sekarang bisa ditekan tanpa error', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingPage()));
      await tester.pumpAndSettle();

      // Langsung ke halaman terakhir
      await tester.tap(find.byKey(Key('lewati_button')));
      await tester.pumpAndSettle();

      final mulaiSekarangButton = find.byKey(Key('mulai_sekarang_button'));
      expect(mulaiSekarangButton, findsOneWidget);

      await tester.tap(mulaiSekarangButton);
      await tester.pumpAndSettle();

      // Belum ada navigasi, tapi memastikan tidak error
    });
  });
}
