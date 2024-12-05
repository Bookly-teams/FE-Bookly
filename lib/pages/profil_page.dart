import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'pengaturan_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background wave
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background_wave.png',
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              // Membungkus seluruh konten dengan SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with settings icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        IconButton(
                          icon: const Icon(Icons.settings, size: 28),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PengaturanPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Profile Picture
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: 84), // Menambah jarak di atas foto profil
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              const AssetImage('assets/images/avatar.png'),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Puan Maharani",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                        Text(
                          "@puanGacorrr",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                        SizedBox(height: 16),
                        // Jumlah karya di bawah username
                        SizedBox(height: 8),
                        Text(
                          '1\nKARYA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Informasi Telah Bergabung dan KARYA di sebelah kiri
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Telah bergabung
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Text(
                          "Telah bergabung sejak Juli 2023",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),

                      // KARYA dengan kotak ungu
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFE4B1F0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 15),
                        child: Text(
                          'KARYA',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),

                      // 1 Cerita Terpublikasi
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Text(
                          "1 Cerita Terpublikasi",
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Book details
                  // Di bagian ListView yang menampilkan detail buku
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      // Ganti ListView dengan Column di sini
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman baca
                            print(
                                "Navigasi menuju halaman baca (belum ada halaman tujuan)");
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const BacaPage()),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/book_cover.png',
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Assalamualaikum Ustadzah",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Plus Jakarta Sans',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.list,
                                            color: Colors.grey,
                                            size:
                                                20, // Ukuran ikon agar proporsional dengan teks
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "25 Bagian",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Plus Jakarta Sans',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Kamu bisa baca e-booknya di Gramedia Digital. Sebagian Part...",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Plus Jakarta Sans',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CustomNavigationBar(
                    currentIndex: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
