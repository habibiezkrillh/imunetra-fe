import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendtenagamedisimunetra/bloc/otp_verificarion/otp_bloc.dart';
import 'package:frontendtenagamedisimunetra/bloc/otp_verificarion/otp_event.dart';
import 'package:frontendtenagamedisimunetra/bloc/otp_verificarion/otp_state.dart';
import 'package:frontendtenagamedisimunetra/services/api_services.dart';
import 'package:frontendtenagamedisimunetra/views/reset_pass.dart';
import 'package:google_fonts/google_fonts.dart';
import '../repository/otp_repository.dart';


class OTPVerificationView extends StatelessWidget {
  const OTPVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OTPBloc(repository: OTPRepository(OTPService()))..add(StartTimer()),
      child: const _OTPVerificationViewContent(),
    );
  }
}

class _OTPVerificationViewContent extends StatefulWidget {
  const _OTPVerificationViewContent();

  @override
  State<_OTPVerificationViewContent> createState() => _OTPVerificationViewContentState();
}

class _OTPVerificationViewContentState extends State<_OTPVerificationViewContent> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  String getOTP() {
    return _controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<OTPBloc, OTPState>(
          listener: (context, state) {
            if (state.isVerified) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ResetPasswordView()));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 90),
                Text('Silahkan cek email anda', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Masukkanlah kode yang telah dikirimkan melalui email',
                    style: GoogleFonts.poppins(color: Colors.black54),
                    textAlign: TextAlign.center),
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
                        controller: _controllers[index],
                        decoration: const InputDecoration(border: InputBorder.none, counterText: ''),
                        style: GoogleFonts.poppins(fontSize: 20),
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
                    style: GoogleFonts.poppins(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '${(state.remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(state.remainingSeconds % 60).toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 300, 
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ResetPasswordView()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D7CFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text("Selanjutnya", style: GoogleFonts.poppins(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 300, 
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<OTPBloc>().add(ResendOTP());
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      side: const BorderSide(color: Color.fromARGB(255, 114, 114, 114)),
                    ),
                    child: Text("Kirim Ulang", style: GoogleFonts.poppins(color: Colors.black)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
