import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/profil_pengaturan_akun.dart';
import 'package:fe_bookly/pages/faq_page.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

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
          'Pengaturan Akun',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // Fitur Profil & Pengaturan
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profil & Pengaturan'),
              onTap: () {
                // Arahkan ke halaman ProfilPengaturanAkunPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilPengaturanAkunPage(), // Menavigasi ke ProfilPengaturanAkunPage
                  ),
                );
              },
            ),
            // Fitur FAQ
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.black),
              title: const Text('FAQ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FAQPage(), // Navigasi ke FAQPage
                  ),
                ); // Tambahkan aksi untuk menampilkan FAQ
              },
            ),
            // Fitur Logout
            ListTile(
              leading: const Icon(Icons.output, color: Colors.black),
              title: const Text('Logout'),
              onTap: () {
                _showLogoutConfirmationDialog(
                    context); // Tampilkan dialog konfirmasi
              },
            ),
          ],
        ),
      ),
    );
  }

// Fungsi untuk menampilkan pop-up dialog konfirmasi logout
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar dari akun?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog tanpa logout
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                _logout(context); // Panggil fungsi logout
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Fungsi logout
  void _logout(BuildContext context) {
    // Aksi logout (contoh: navigasi ke halaman login atau hapus session)
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
