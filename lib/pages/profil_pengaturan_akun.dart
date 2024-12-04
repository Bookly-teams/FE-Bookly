import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pengguna_provider.dart';
import 'edit_profil.dart'; // Pastikan file ini ada dan berfungsi
import 'edit_password.dart'; // Pastikan file ini ada dan berfungsi

class ProfilPengaturanAkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pengguna = Provider.of<PenggunaProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Menambahkan aksi kembali
          },
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
            // Bagian Foto Profil
            GestureDetector(
              onTap: () {
                // Mengarahkan ke halaman Ganti Foto Profil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GantiFotoProfilPage(
                      fotoProfilAwal: pengguna.fotoProfil ?? '',
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: pengguna.fotoProfil != null &&
                            pengguna.fotoProfil!.isNotEmpty
                        ? FileImage(File(pengguna.fotoProfil!))
                        : const AssetImage('assets/images/avatar.png')
                            as ImageProvider,
                  ),
                  const SizedBox(
                      width: 16), // Memberikan jarak antara foto dan teks
                  const Text(
                    "Gambar Profil",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Bagian "Tentang"
            const Text(
              "Tentang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Nama Pengguna'),
              subtitle: Text(pengguna.namaPengguna),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNamaPage(
                      title: "Nama Pengguna",
                      initialValue: pengguna.namaPengguna,
                      onSave: (namaBaru) {
                        pengguna.ubahNamaPengguna(namaBaru);
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Nama Lengkap'),
              subtitle: Text(pengguna.namaLengkap),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNamaPage(
                      title: "Nama Lengkap",
                      initialValue: pengguna.namaLengkap,
                      onSave: (namaBaru) {
                        pengguna.ubahNamaLengkap(namaBaru);
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // Bagian "Pengaturan Akun"
            const Text(
              "Pengaturan Akun",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(pengguna.email),
            ),
            ListTile(
              title: const Text('Kata Sandi'),
              subtitle: Text(pengguna.kataSandi),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GantiKataSandiPage(),
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
                        builder: (context) => GantiKataSandiPage()),
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
