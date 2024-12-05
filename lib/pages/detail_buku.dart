import 'package:flutter/material.dart';
import 'notif_tambah_buku.dart'; // 
import 'daftar_baca.dart'; // Import NovelChapterPage

class DetailNovelPage extends StatelessWidget {
  const DetailNovelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String novelTitle = 'Orang Biasa';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/orang_biasa.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Orang Biasa',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Plus Sans Jakarta",
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: const AssetImage('assets/images/profil_penulis.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Marronad',
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.grey,
                            fontFamily: "Plus Sans Jakarta",
                            ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.list, size: 16, color: Colors.grey),
                        const Text(
                          ' 50 Bagian',
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.grey,
                            fontFamily: "Plus Sans Jakarta",
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade300,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NovelChapterPage(
                                  novelTitle: novelTitle,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat Daftar Bab',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Plus Sans Jakarta",
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Menampilkan pemberitahuan
                              showCustomPopup(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade100,
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Adipati terpaksa menikah sepeninggal wasiat kedua orang tua Tisana. '
                  'Namun, perjodohan itu terjadi ketika kepopuleran Adipati sebagai penyanyi '
                  'sedang melonjak tinggi dan Tisana yang bertekad melanjutkan studi. Apakah keduanya '
                  'dapat mengorbankan impian demi pernikahan mereka?\n\n'
                  '***\n\n'
                  'Adipati terbiasa dengan kehidupannya sebagai penyanyi, membiarkan hari-harinya '
                  'terisi dengan penampilan mulai dari panggung kecil hingga tur nasional. Namun, ia '
                  'dikejutkan oleh kabar, sepeninggal pasangan rekan bisnis orang tua Adipati akibat '
                  'kecelakaan, bahwa ia harus menikahi Tisana yang merupakan anak tunggal dari mendiang '
                  'teman orang tuanya itu. Di sisi lain, Tisana yang baru saja akan menyelesaikan jenjang '
                  'kuliah lalu dikejutkan atas kematian kedua orang tuanya, mendapatkan wasiat untuk menikahi '
                  'Adipati. Ketika keduanya terpaksa menikah atas desakan keadaan dan akhirnya menerima takdir, '
                  'apakah mereka sanggup menahan ego dan meredam impian demi mempertahankan cinta yang baru saja tumbuh?',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black87,
                    fontFamily: "Plus Sans Jakarta",
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
