import 'package:fe_bookly/pages/layoutbuku.dart';
import 'package:flutter/material.dart';

class TampilanPerpustakaan extends StatefulWidget {
  @override
  _TampilanPerpustakaanState createState() => _TampilanPerpustakaanState();
}

class _TampilanPerpustakaanState extends State<TampilanPerpustakaan> {
  final List<String> bookTitles = [
    'one day one ayat juz 1',
    'alphas destiny',
    'ralion',
    'true stalker',
    'eva si tokoh figuran',
    'ghost class',
    'a feather away',
    'linger',
    'mr. right',
    'not your princess',
    'oon in action',
    'terjebak kata sahabat'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perpustakaan'),
        backgroundColor: Colors.white, // Ubah ke warna putih
        elevation: 0, // Hilangkan bayangan
        titleTextStyle: TextStyle(
          color: Colors.black, // Warna teks hitam agar kontras dengan latar putih
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Warna ikon juga disesuaikan agar terlihat
        ),
      ),
      body: Container(
        color: Colors.white, // Background body berwarna putih
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight, // Atur posisi ke kanan atas
              child: Text(
                '${bookTitles.length} Buku',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: bookTitles.map((title) => Layoutbuku(title)).toList(),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}