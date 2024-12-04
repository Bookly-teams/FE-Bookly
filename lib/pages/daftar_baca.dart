import 'package:flutter/material.dart';
import 'tampilan_baca.dart';

class NovelChapterPage extends StatelessWidget {
  final String novelTitle;

  const NovelChapterPage({
    Key? key,
    required this.novelTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chapters = [
      {
        'title': 'Prolog',
        'date': '26/08/2020',
        'content': 'Minggu konser terakhir setelah ini bisa beristirahat. melakukan tur di beberapa kota sudah menjadi kebiasaan bagi Adipati. Kegiatan malam minggu masih sama, bernyanyi lalu bertemu beberapa penggemar.\n\nSeperti angin laut ... Yang mendebarkan membawa aku dalam genggaman yang sulit ku gapai. Kini tak ada lagi kisah kita hanya ada kisah sendiri. Beri aku kesempatan sekali lagi .... Meski itu tidak mungkin, kutahu kamu sudah pergi dari hidupku." Adipati menyodorkan mikrofon ke arah penggemar untuk menyanyikan bersama-sama. Mereka bernyanyi serempak mengikuti Adipati dan alunan musik, kelap-kelip lampu menambah nuansa malam ini semakin sendu. Menyanyikan judul lagu perpisahan dari album kedua Adipati.',
      },
      {
        'title': 'Satu',
        'date': '26/08/2020',
        'content': 'Ini adalah konten Bab Satu.',
      },
      {
        'title': 'Dua',
        'date': '27/08/2020',
        'content': 'Ini adalah konten Bab Dua.',
      },
      {
        'title': 'Tiga',
        'date': '27/08/2020',
        'content': 'Ini adalah konten Bab Tiga.',
      },
      {
        'title': 'Empat',
        'date': '28/08/2020',
        'content': 'Ini adalah konten Bab Empat.',
      },
      {
        'title': 'Lima',
        'date': '28/08/2020',
        'content': 'Ini adalah konten Bab Lima.',
      },
      {
        'title': 'Enam',
        'date': '28/08/2020',
        'content': 'Ini adalah konten Bab Enam.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '$novelTitle - Daftar Bab',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: chapters.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NovelPage(
                    title: chapter['title']!,
                    content: chapter['content']!,
                    novelTitle: novelTitle,
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chapter['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      chapter['date']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}