import 'dart:convert';

import 'package:flutter/material.dart';

class NewStoryCard extends StatelessWidget {
  const NewStoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 93,
            height: 144,
            decoration: BoxDecoration(
              color: const Color(0xFFF9EFFF),
              borderRadius: BorderRadius.circular(4),
              // Put your image here
              image: const DecorationImage(
                image: AssetImage('assets/images/create_plus.png'),
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Buat cerita baru',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String? cover; // URL atau path ke gambar
  final String? judul;
  final int? totalBagian;

  const StoryCard(
      {super.key, required this.cover, required this.judul, this.totalBagian});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 93,
            height: 144,
            decoration: BoxDecoration(
              color: const Color(0xFFF9EFFF),
              borderRadius: BorderRadius.circular(4),
              image: cover != null
                  ? DecorationImage(
                      image: MemoryImage(base64Decode(cover!)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            judul ?? '',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Plus Jakarta Sans',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          // Menampilkan totalBagian dengan label
          Text(
            '${totalBagian ?? 0} Bagian',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ],
      ),
    );
  }
}
