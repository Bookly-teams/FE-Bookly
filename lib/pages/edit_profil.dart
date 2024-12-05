import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GantiFotoProfilPage extends StatefulWidget {
  final String fotoProfilAwal;

  const GantiFotoProfilPage({Key? key, required this.fotoProfilAwal})
      : super(key: key);

  @override
  _GantiFotoProfilPageState createState() => _GantiFotoProfilPageState();
}

class _GantiFotoProfilPageState extends State<GantiFotoProfilPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _simpanPathGambar(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', imagePath);
  }

  Future<void> _ambilGambarDariGaleri() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _ambilGambarDariKamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<String?> _ambilPathGambar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image_path');
  }

  @override
  void initState() {
    super.initState();
    _ambilPathGambar().then((imagePath) {
      if (imagePath != null) {
        setState(() {
          _selectedImage = File(imagePath);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ganti Foto Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _selectedImage != null
                  ? FileImage(_selectedImage!)
                  : (widget.fotoProfilAwal.isNotEmpty
                          ? NetworkImage(widget.fotoProfilAwal)
                          : const AssetImage('assets/images/avatar.png'))
                      as ImageProvider,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _ambilGambarDariGaleri,
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Galeri"),
                ),
                ElevatedButton.icon(
                  onPressed: _ambilGambarDariKamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Kamera"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                if (_selectedImage != null) {
                  await _simpanPathGambar(_selectedImage!.path);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Foto profil berhasil disimpan!')),
                  );
                }
                Navigator.pop(context, _selectedImage?.path);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
