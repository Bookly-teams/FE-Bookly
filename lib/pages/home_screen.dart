import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "cover": "assets/images/orangbiasa.png",
      "title": "Orang Biasa",
      "author": "@marronad",
      "parts": "50 Bagian",
      "description":
          "Adipati terpaksa menikah sepeninggal wasiat kedua orang tua Tisana. Namun, perjodohan itu terjadi ketika...",
    },
    {
      "cover": "assets/images/battlewithsenior.png",
      "title": "Battle With Senior",
      "author": "@candy_perkins",
      "parts": "40 Bagian",
      "description":
          "Dari 999 siswa-siswi di sekolah ini, cuman kamu yang paling berani dengan saya.",
    },
    {
      "cover": "assets/images/arunika.png",
      "title": "Arunika’s World",
      "author": "@destharan.kenanga",
      "parts": "61 Bagian",
      "description":
          "Seingat Arunika Prameswari, malam sebelum tidur, dia masih gadis biasa saja. Gadis yang hidup di desa bersama keluarganya...",
    },
    {
      "cover": "assets/images/jamtanganarthur.png",
      "title": "Jam Tangan Milik Arthur",
      "author": "@mitalyas",
      "parts": "52 Bagian",
      "description":
          "Semenjak kematian sang ayah tahun lalu, Arthur meninggalkan...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Beranda',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          story['cover']!,
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                story['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                story['author']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontFamily: 'Plus Jakarta Sans',
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.list, // Ikon sederhana tanpa frame
                                    size: 16,
                                    color: Colors.grey[700],
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    story['parts']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      fontFamily: 'Plus Jakarta Sans',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                story['description']!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Plus Jakarta Sans',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
