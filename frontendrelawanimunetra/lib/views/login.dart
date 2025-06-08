import 'package:flutter/material.dart';
import 'package:frontendtenagamedisimunetra/views/forgot_pass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontendtenagamedisimunetra/views/register.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _usernameError = false;
  bool _passwordError = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String errorText,
    required bool isError,
    required bool obscure,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isError ? Colors.red : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: controller,
              obscureText: obscure,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(icon, color: const Color(0xFF3B6BFD)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
        ),
        if (isError)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 6),
            child: Text(
              errorText,
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

void _handleLogin() {
  setState(() {
    _usernameError = usernameController.text.isEmpty;
    _passwordError = passwordController.text.isEmpty;
  });

  if (!_usernameError && !_passwordError) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordView(), //untuk sementara karena dashboard pisah
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Center(
                    child: Image.asset(
                      'assets/images/Logo.jpg',
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Selamat Datang Kembali\nke Imunetra',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildInputField(
                          controller: usernameController,
                          hintText: 'Username',
                          icon: Icons.person,
                          errorText: 'Username tidak boleh kosong',
                          isError: _usernameError,
                          obscure: false,
                        ),
                        const SizedBox(height: 25),
                        _buildInputField(
                          controller: passwordController,
                          hintText: 'Kata Sandi',
                          icon: Icons.lock,
                          errorText: 'Kata sandi tidak boleh kosong',
                          isError: _passwordError,
                          obscure: true,
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordView(),
                              ),
                            );
                          },
                          child: Text(
                            'Lupa Kata Sandi?',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF3B6BFD),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: GestureDetector(
                            onTap: _handleLogin,
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3B6BFD),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Masuk',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 140), // spacer untuk menghindari overlap
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Memiliki Akun?',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3B6BFD),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
