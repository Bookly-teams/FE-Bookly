import 'package:fe_bookly/pages/edit_password.dart';
import 'package:flutter/material.dart';

class ProfilPengaturanAkunPage extends StatelessWidget {
  const ProfilPengaturanAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
            // Profile Picture Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(width: 16),
                const Text(
                  "Gambar Profil",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // About Section
            const Text(
              "Tentang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Nama Pengguna'),
              subtitle: const Text('@puanGacorrr'),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              title: const Text('Nama Lengkap'),
              subtitle: const Text('Puan Maharani'),
              onTap: () {
                // Handle tap
              },
            ),
            const SizedBox(height: 24),

            // Account Settings Section
            const Text(
              "Pengaturan Akun",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              title: Text('Email'),
              subtitle: Text('puan_maharani2004@gmail.com'),
            ),
            ListTile(
              title: const Text('Kata Sandi'),
              subtitle: const Text('********'),
              onTap: () {
                // Handle password change
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
