import 'package:flutter/material.dart';

class Layoutbuku extends StatelessWidget {
  final String judul;

  Layoutbuku(this.judul);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 160), // Control maximum height
      child: Column(
        mainAxisSize: MainAxisSize.min, // Use minimum space needed
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 100.0, // Reduced height
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
          SizedBox(height: 4.0), // Reduced spacing
          Flexible(
            // Make text area flexible
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                judul,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0, // Slightly smaller font
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
