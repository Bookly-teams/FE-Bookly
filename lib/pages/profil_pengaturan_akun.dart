import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fe_bookly/pages/edit_password.dart';
import 'package:fe_bookly/pages/edit_profil.dart';
import 'package:fe_bookly/pages/edit_nama.dart';

class ProfilPengaturanAkunPage extends StatefulWidget {
  const ProfilPengaturanAkunPage({super.key});

  @override
  _ProfilPengaturanAkunPageState createState() =>
      _ProfilPengaturanAkunPageState();
}

class _ProfilPengaturanAkunPageState extends State<ProfilPengaturanAkunPage> {
  String _namaPengguna = '@puanGacorrr';
  String _namaLengkap = 'Puan Maharani';
  String _email = 'puan_maharani2004@gmail.com';
  String _kataSandi = '********';
  String? _fotoProfil = 'assets/images/avatar.png';

  @override
  void initState() {
    super.initState();
    _loadFotoProfil(); // Load foto profil saat halaman pertama kali dibuka
  }

  // Fungsi untuk mengambil foto profil dari SharedPreferences
  Future<void> _loadFotoProfil() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fotoProfil = prefs.getString(
          'profile_image_path'); // Ambil foto profil dari SharedPreferences
    });
  }

  Future<void> _saveFotoProfil(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'profile_image_path', imagePath); // Menyimpan foto profil
  }

  // Update the image provider logic
  ImageProvider _getImageProvider() {
    if (_fotoProfil != null && _fotoProfil!.isNotEmpty) {
      final file = File(_fotoProfil!);
      if (file.existsSync()) {
        return FileImage(file);
      }
    }
    return const AssetImage('assets/images/avatar.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profil & Pengaturan Akun',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                // Langsung buka halaman ganti foto profil dengan foto profil awal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GantiFotoProfilPage(
                      fotoProfilAwal: _fotoProfil ??
                          'assets/imPges/avatar.png', // Provide a default value
                    ),
                  ),
                ).then((updatedImagePath) {
                  if (updatedImagePath != null) {
                    setState(() {
                      _fotoProfil = updatedImagePath;
                    });
                    _saveFotoProfil(updatedImagePath);
                  }
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: _getImageProvider(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Gambar Profil",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Tentang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Nama Pengguna'),
              subtitle: Text(_namaPengguna),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNamaPage(
                      title: 'Nama Pengguna',
                      initialValue: _namaPengguna,
                      onSave: (newValue) {
                        setState(() {
                          _namaPengguna = newValue;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Nama Lengkap'),
              subtitle: Text(_namaLengkap),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNamaPage(
                      title: 'Nama Lengkap',
                      initialValue: _namaLengkap,
                      onSave: (newValue) {
                        setState(() {
                          _namaLengkap = newValue;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "Pengaturan Akun",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(_email),
            ),
            ListTile(
              title: const Text('Kata Sandi'),
              subtitle: Text(_kataSandi),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GantiKataSandiPage(),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GantiKataSandiPage(),
                    ),
                  );
                },
                child: const Text("Lupa kata sandi?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
