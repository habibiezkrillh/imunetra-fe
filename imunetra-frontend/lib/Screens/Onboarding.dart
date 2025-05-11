import 'package:flutter/material.dart';
import 'HomeUser.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/Gambar1.png',
      'title': 'Selamat datang di NaikPete',
    },
    {
      'image': 'assets/images/Gambar2.png',
      'title': 'Selamat menikmati perjalanan yang nyaman dan terjamin',
    },
    {
      'image': 'assets/images/Gambar3.png',
      'title': 'Let’s Get Started',
    },
  ];

  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreens(username: ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final image = _onboardingData[index]['image'];
                final title = _onboardingData[index]['title'];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image != null && image.isNotEmpty
                        ? Image.asset(image, height: 300)
                        : const Icon(Icons.image_not_supported, size: 100),
                    const SizedBox(height: 20),
                    Text(
                      title ?? 'Title not available',
                      textAlign: TextAlign.center, // Rata tengah
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_currentPage == _onboardingData.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed: _goToHomeScreen,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.cyan, // Warna tulisan putih
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 40), // Ukuran tombol diperbesar
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Sudut membulat
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18), // Perbesar tulisan
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 8,
                      width: _currentPage == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPage == _onboardingData.length - 1) {
                      _goToHomeScreen();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
