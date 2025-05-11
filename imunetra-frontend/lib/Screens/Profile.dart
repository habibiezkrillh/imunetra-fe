import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Pesan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                "Profil",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile_image.jpg'), // ganti sesuai asset kamu
              ),
              const SizedBox(height: 30),
              _buildTextField(icon: Icons.person, hintText: "Nama"),
              const SizedBox(height: 15),
              _buildTextField(icon: Icons.email, hintText: "Alamat E-Mail"),
              const SizedBox(height: 15),
              _buildDropdownField(),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
                    ),
                    child: const Text("+62"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(hintText: "Nomor Telpon", icon: null),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text("Keluar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Edit Profil"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({IconData? icon, String? hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon, color: Colors.blue) : null,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          icon: Icon(Icons.location_on, color: Colors.blue),
          border: InputBorder.none,
        ),
        hint: const Text("Kota Domisili"),
        items: ["Makassar", "Jakarta", "Bandung"]
            .map((city) => DropdownMenuItem(value: city, child: Text(city)))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
