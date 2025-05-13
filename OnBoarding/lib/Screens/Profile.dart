import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Text(
                  'Profil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(File(_image!.path))
                          : NetworkImage(
                              'https://i.pinimg.com/originals/f3/0d/b9/f30db95038eb6ad9a0e04316d7e9e17b.jpg',
                            ) as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.photo_camera),
                                    title: Text('Ambil Foto'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Pilih dari Galeri'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 4),
                            ],
                          ),
                          child: Icon(Icons.edit, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                _buildInputField(Icons.person_outline, 'Nama', border),
                SizedBox(height: 16),
                _buildInputField(Icons.email_outlined, 'Alamat E-Mail', border),
                SizedBox(height: 16),
                _buildDropdownField(border),
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Text('+62', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildInputField(null, 'Nomor Telepon', border),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                _buildMainButton(
                  color: Colors.red,
                  text: 'Keluar',
                  icon: Icons.logout,
                  borderRadius: 30,
                ),
                SizedBox(height: 32),
                _buildMainButton(
                  color: Colors.blue,
                  text: 'Edit Profil',
                  borderRadius: 30,
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData? icon, String hint, OutlineInputBorder border) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          hintText: hint,
          border: border,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }

  Widget _buildDropdownField(OutlineInputBorder border) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.location_city, color: Colors.blue),
          hintText: 'Kota Domisili',
          border: border,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        items: ['Makassar', 'Jakarta', 'Surabaya'].map((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildMainButton({
    required Color color,
    required String text,
    IconData? icon,
    double borderRadius = 10,
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 2,
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                SizedBox(width: 8),
                Icon(icon, color: Colors.white),
              ],
            )
          : Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
