import 'package:flutter/material.dart';

class Layoutbuku extends StatelessWidget {
  final String judul;

  Layoutbuku(this.judul);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.transparent, // Set background to transparent
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
         Container(
            width: 80,
            height: 120.0, // Tinggi tetap untuk cover
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0), // Sudut melengkung
              child: Image.asset(
                'assets/images/cover_buku/$judul.jpg',
                fit: BoxFit.cover, // Crop gambar agar sesuai ukuran
                errorBuilder: (context, error, stackTrace) {
                  // Penanganan gambar tidak ditemukan
                  return Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8.0), // Jarak antara cover dan judul
          // Judul buku
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              judul,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0, // Ukuran font judul
              ),
              textAlign: TextAlign.center, // Rata tengah teks
              maxLines: 2, // Maksimal 2 baris
              overflow: TextOverflow.ellipsis, // Potong jika teks terlalu panjang
            ),
          ),
        ],
      ),
    );
  }
}