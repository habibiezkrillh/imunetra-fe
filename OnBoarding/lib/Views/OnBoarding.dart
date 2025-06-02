import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imunetra/bloc/OnBoarding_bloc.dart';
import 'package:imunetra/services/onBoard_service.dart';

class OnboardingPage extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(OnboardingService()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              final screenWidth = MediaQuery.of(context).size.width;
              final screenHeight = MediaQuery.of(context).size.height;

              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: state.pages.length,
                      onPageChanged: cubit.updatePage,
                      itemBuilder: (_, index) {
                        final data = state.pages[index];
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 80),
                                Text(
                                  "Imunetra",
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Image.asset(
                                  data.image,
                                  width: screenWidth * 0.9,
                                  height: screenHeight * 0.4,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 24),
                                Text(
                                  data.desc,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      state.pages.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: state.currentPage == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: state.currentPage == index ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: (state.currentPage < state.pages.length - 1)
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      _controller.animateToPage(
                                        state.pages.length - 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      cubit.updatePage(state.pages.length - 1);
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      textStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    child: Text("Lewati"),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _controller.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      cubit.nextPage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF3B6BFD),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 20), // Tambah tinggi
                                      minimumSize: Size(0, 60), // Atur tinggi minimum
                                    ),
                                    child: Text(
                                      "Lanjut",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16, // Lebih besar
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Center(
                            child: SizedBox(
                                width: 250,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigasi ke halaman selanjutnya
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF3B6BFD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Mulai Sekarang",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                    ),
                  SizedBox(height: 90),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
