import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imunetra/Views/OnBoarding.dart';

void main() {
  testWidgets('OnboardingScreen shows first page correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    // Halaman pertama
    expect(find.text('Peduli Sejak Dini'), findsOneWidget);
    expect(find.text('Bersama kita cegah pneumonia pada anak-anak yang membutuhkan perhatian lebih.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);

    // Cek dot aktif di halaman pertama
    final firstDot = tester.widget<Container>(find.byKey(Key('dot_0')));
    expect((firstDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));
  });

  testWidgets('Tombol next berpindah ke halaman kedua dan ketiga', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    // Tap next ke halaman kedua
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    expect(find.text('Dukung Aksi Cepat'), findsOneWidget);
    expect(find.text('Bantu relawan dan puskesmas mendeteksi gejala lebih cepat di daerah terpencil.'), findsOneWidget);

    final secondDot = tester.widget<Container>(find.byKey(Key('dot_1')));
    expect((secondDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));

    // Tap next ke halaman ketiga
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    expect(find.text('Mulai Dari Sekarang'), findsOneWidget);
    expect(find.text('Mulai langkah awal untuk mencegah bahaya pneumonia sejak dini.'), findsOneWidget);

    final thirdDot = tester.widget<Container>(find.byKey(Key('dot_2')));
    expect((thirdDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));
  });

  testWidgets('Tombol Skip ada dan dapat ditekan', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    expect(find.text('Skip'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pump();

    // Belum ada navigasi, tapi pastikan tidak error saat ditekan
  });
}
