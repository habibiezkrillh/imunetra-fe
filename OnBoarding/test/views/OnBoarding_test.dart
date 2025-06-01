import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imunetra/bloc/OnBoarding_bloc.dart';
import 'package:imunetra/services/onBoard_service.dart';
import 'package:imunetra/views/OnBoarding.dart';

void main() {
  group('OnboardingPage Widget Test', () {
    testWidgets('Menampilkan halaman pertama dengan gambar dan teks', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      // Tunggu hingga widget selesai dirender
      await tester.pumpAndSettle();

      // Cek keberadaan widget
      expect(find.text('Imunetra'), findsWidgets); // Judul tampil
      expect(find.byType(Image), findsOneWidget); // Gambar tampil
      expect(find.textContaining('pneumonia'), findsWidgets); // Deskripsi tampil
      expect(find.text('Lewati'), findsOneWidget);
      expect(find.text('Lanjut'), findsOneWidget);
    });

    testWidgets('Mengklik tombol Lanjut berpindah halaman', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Klik tombol Lanjut
      final lanjutButton = find.text('Lanjut');
      expect(lanjutButton, findsOneWidget);

      await tester.tap(lanjutButton);
      await tester.pumpAndSettle();

      // Pastikan halaman berpindah (judul tetap sama, tapi deskripsi berubah)
      expect(find.textContaining('profesional'), findsWidgets); // Cek teks di halaman kedua
    });

    testWidgets('Klik tombol Lewati tidak menyebabkan error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final lewatiButton = find.text('Lewati');
      await tester.tap(lewatiButton);
      await tester.pumpAndSettle();

      // Tidak terjadi error, navigasi bisa ditambahkan dalam expect ke halaman lain
    });
  });
}
