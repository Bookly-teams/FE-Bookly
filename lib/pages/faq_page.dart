import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar FAQ
    final List<Map<String, String>> faqList = [
      {
        "question": "Apakah membaca buku di Bookly gratis?",
        "answer":
            "Ya, banyak buku di Bookly yang bisa dibaca secara gratis. Namun, beberapa cerita premium mungkin memerlukan pembelian koin atau berlangganan untuk diakses."
      },
      {
        "question": "Bagaimana cara menulis cerita di Bookly?",
        "answer":
            "Setelah Anda mendaftar dan masuk ke akun, pilih opsi 'Tulis Cerita' dari menu utama. Anda dapat mulai menulis cerita baru, menyimpannya sebagai draf, atau membagikannya kepada pembaca di platform."
      },
      {
        "question": "Apakah cerita yang saya tulis bisa dihapus?",
        "answer":
            "Ya, Anda bisa menghapus cerita kapan saja dari akun Anda. Cukup buka cerita tersebut, lalu pilih opsi 'Hapus Cerita'."
      },
      {
        "question":
            "Bagaimana cara menemukan buku atau cerita yang sesuai dengan minat saya?",
        "answer":
            "Gunakan fitur pencarian atau eksplorasi kategori di aplikasi untuk menemukan cerita yang sesuai dengan minat Anda."
      },
      {
        "question":
            "Apa yang harus dilakukan jika saya mengalami masalah teknis?",
        "answer":
            "Jika Anda mengalami masalah teknis, seperti aplikasi tidak bisa dibuka atau terjadi error, silakan hubungi tim dukungan melalui kirim email ke support@bookly.com."
      },
      {
        "question": "Apakah data pribadi saya aman di Bookly?",
        "answer":
            "Keamanan data pengguna adalah prioritas kami. Kami menggunakan protokol enkripsi dan langkah-langkah keamanan lain untuk melindungi informasi Anda. Baca Kebijakan Privasi kami untuk detail lebih lanjut."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'FAQ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            final faq = faqList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, // Hilangkan garis bawaan
                  ),
                  child: ExpansionTile(
                    title: Text(
                      faq["question"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          faq["answer"]!,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                if (index != faqList.length - 1)
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                    height: 32, // Mengatur jarak antar elemen
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
