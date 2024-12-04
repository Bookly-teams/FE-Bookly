import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'pengguna_provider.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNamaPage extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function(String) onSave;

  const EditNamaPage({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Masukkan $title"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}

class GantiFotoProfilPage extends StatefulWidget {
  final String fotoProfilAwal;

  GantiFotoProfilPage({required this.fotoProfilAwal});

  @override
  _GantiFotoProfilPageState createState() => _GantiFotoProfilPageState();
}

class _GantiFotoProfilPageState extends State<GantiFotoProfilPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

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

  // Menyimpan gambar secara lokal dan memperbarui path
  Future<void> _simpanGambarSecaraLokal() async {
    if (_selectedImage == null) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = path.join(directory.path, 'foto_profil.png');
      await File(_selectedImage!.path).copy(newPath);
      await _simpanPathGambar(newPath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Foto disimpan di: $newPath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saat menyimpan gambar: $e')),
      );
    }
  }

  Future<void> _simpanPathGambar(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', imagePath);
  }

  Future<String?> _ambilPathGambar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image_path');
  }

  @override
  Widget build(BuildContext context) {
    final pengguna = Provider.of<PenggunaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ganti Foto Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Menampilkan gambar profil yang dipilih atau default
            CircleAvatar(
              radius: 50,
              backgroundImage: _selectedImage != null
                  ? FileImage(_selectedImage!)
                  : (pengguna.fotoProfil != null
                      ? FileImage(File(pengguna.fotoProfil!))
                      : NetworkImage(widget.fotoProfilAwal)) as ImageProvider,
            ),
            const SizedBox(height: 16),
            // Tombol untuk memilih gambar dari galeri atau kamera
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
                  final filePath = _selectedImage!.path;
                  // Menyimpan path gambar ke provider dan SharedPreferences
                  await _simpanPathGambar(filePath);
                  pengguna.ubahFotoProfil(
                      filePath); // Update foto profil di provider
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Foto profil diperbarui')),
                  );
                }
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
