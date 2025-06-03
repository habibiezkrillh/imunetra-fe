import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontendtenagamedisimunetra/views/login.dart'; // Make sure this path is correct

void main() {
  group('LoginView Widget Tests', () {
    testWidgets('Menampilkan teks sambutan LoginView', (tester) async {
      // Tampilkan LoginView
      await tester.pumpWidget(
        const MaterialApp(home: LoginView()),
      );

      // Periksa apakah teks "Selamat Datang Kembali ke Imunetra" ditemukan
      expect(find.text('Selamat Datang Kembali\nke Imunetra'), findsOneWidget);
    });
  });

  testWidgets('Menampilkan gambar logo di LoginView', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginView()),
    );

    // Mencari widget Image dengan asset tertentu
    final logoFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == 'assets/images/Logo.jpg',
    );

    expect(logoFinder, findsOneWidget);
  });

}
                 
