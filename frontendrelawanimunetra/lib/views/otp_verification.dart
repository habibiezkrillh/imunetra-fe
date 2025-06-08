import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontendtenagamedisimunetra/views/reset_pass.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPVerificationView extends StatefulWidget {
  const OTPVerificationView({super.key});

  @override
  State<OTPVerificationView> createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  late Timer _timer;
  int _remainingSeconds = 300; 

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Silahkan cek email anda',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Masukkanlah kode yang telah dikirimkan melalui email',
              style: GoogleFonts.poppins(
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black26),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: 'Kode kadaluarsa dalam ',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: _formatTime(_remainingSeconds),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D7CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const ResetPasswordView()),
                  );
                },
                child: Text(
                  "Selanjutnya",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Color.fromARGB(255, 87, 87, 87)),
                ),
                onPressed: () {
                  // reset timer atau request kode baru
                  setState(() {
                    _remainingSeconds = 300;
                    _timer.cancel();
                    _startTimer();
                  });
                },
                child: Text(
                  "Kirim Ulang",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
