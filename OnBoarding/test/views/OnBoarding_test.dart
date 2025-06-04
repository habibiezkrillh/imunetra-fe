import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imunetra/Views/OnBoarding.dart';

void main() {
  testWidgets('OnboardingScreen shows first page correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    // Cek halaman pertama muncul
    expect(find.text('Peduli Sejak Dini'), findsOneWidget);
    expect(find.text('Bersama kita cegah pneumonia pada anak-anak yang membutuhkan perhatian lebih.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);

    // Cek dot indikator halaman pertama
    final firstDot = tester.widget<Container>(find.byType(Container).at(0));
    expect((firstDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));
  });

  testWidgets('Tombol next berpindah ke halaman kedua dan ketiga', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    // Tap tombol next ke halaman kedua
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    // Cek halaman kedua muncul
    expect(find.text('Dukung Aksi Cepat'), findsOneWidget);
    expect(find.text('Bantu relawan dan puskesmas mendeteksi gejala lebih cepat di daerah terpencil.'), findsOneWidget);

    // Cek dot indikator halaman kedua
    final secondDot = tester.widget<Container>(find.byType(Container).at(1));
    expect((secondDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));

    // Tap tombol next ke halaman ketiga
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    // Cek halaman ketiga muncul
    expect(find.text('Mulai Dari Sekarang'), findsOneWidget);
    expect(find.text('Mulai langkah awal untuk mencegah bahaya pneumonia sejak dini.'), findsOneWidget);

    // Cek dot indikator halaman ketiga
    final thirdDot = tester.widget<Container>(find.byType(Container).at(2));
    expect((thirdDot.decoration as BoxDecoration).color, Color(0xff3B6BFD));
  });

  testWidgets('Tombol Skip ada dan dapat ditekan', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    expect(find.text('Skip'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pump();

    // Karena tombol Skip belum navigasi, tidak ada perubahan UI, cukup memastikan tombol bisa ditekan tanpa error
  });
}
