import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: state.pages.length,
                      onPageChanged: cubit.updatePage,
                      itemBuilder: (_, index) {
                        final data = state.pages[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(data.image, width: 300, height: 200),
                            SizedBox(height: 30),
                            Text(data.title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(data.desc, textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Kosongkan navigasi
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF484848),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Lewati",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (state.currentPage < state.pages.length - 1) {
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  cubit.nextPage();
                                } else {
                                  // Kosongkan navigasi akhir
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF3B6BFD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                state.currentPage == state.pages.length - 1 ? "Mulai" : "Lanjut",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
