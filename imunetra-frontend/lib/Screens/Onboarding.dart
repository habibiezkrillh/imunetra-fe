import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/gambar1.png",
      "title": "Imunetra",
      "desc": "Bersama kita cegah pneumonia pada anak-anak yang membutuhkan."
    },
    {
      "image": "assets/images/gambar2.png",
      "title": "Imunetra",
      "desc": "Pantau kesehatan anak secara langsung dengan sistem cerdas."
    },
    {
      "image": "assets/images/gambar3.png",
      "title": "Imunetra",
      "desc": "Bantu relawan dan petugas kesehatan menjangkau lebih banyak anak."
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Arahkan ke halaman utama atau login
      print("Onboarding selesai");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]['image']!),
                      SizedBox(height: 32),
                      Text(
                        onboardingData[index]['title']!,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        onboardingData[index]['desc']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip ke akhir atau halaman login
                    print("Lewati");
                  },
                  child: Text("Lewati", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Lanjut"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
