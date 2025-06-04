import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Peduli Sejak Dini",
      "desc": "Bersama kita cegah pneumonia pada anak-anak yang membutuhkan perhatian lebih.",
      "image": "assets/images/gambar1.png",
    },
    {
      "title": "Dukung Aksi Cepat",
      "desc": "Bantu relawan dan puskesmas mendeteksi gejala lebih cepat di daerah terpencil.",
      "image": "assets/images/gambar2.png",
    },
    {
      "title": "Mulai Dari Sekarang",
      "desc": "Mulai langkah awal untuk mencegah bahaya pneumonia sejak dini.",
      "image": "assets/images/gambar3.png",
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // TODO: Navigasi ke Home/Login
      print("Onboarding selesai!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              /// Skip button - tetap di atas
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigasi ke Home/Login
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              /// PageView hanya untuk konten yang berubah
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Image.asset(onboardingData[index]["image"]!),
                        ),
                        SizedBox(height: 20),
                        Text(
                          onboardingData[index]["title"]!,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          onboardingData[index]["desc"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 40),

              /// Row untuk dot dan tombol next - tetap di bawah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (i) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == i ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == i ? Color(0xff3B6BFD) : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      backgroundColor: Color(0xff3B6BFD),
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
