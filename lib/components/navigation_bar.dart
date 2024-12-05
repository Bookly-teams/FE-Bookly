import 'package:fe_bookly/pages/beranda.dart';
import 'package:fe_bookly/pages/library.dart';
import 'package:fe_bookly/pages/perpustakaan.dart';
import 'package:fe_bookly/pages/profil_page.dart';
import 'package:fe_bookly/pages/search_screen.dart';
import 'package:fe_bookly/pages/tulis.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex; // Menyimpan index halaman aktif

  const CustomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9EFFF),
        borderRadius: BorderRadius.circular(55),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
            color: Color.fromRGBO(10, 13, 18, 0.10),
          ),
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
            color: Color.fromRGBO(10, 13, 18, 0.06),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Beranda()),
                  (route) => false);
            },
            child: Image.asset(
              currentIndex == 0
                  ? 'assets/images/home_active.png'
                  : 'assets/images/home_non.png',
              width: 20,
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                  (route) => false);
            },
            child: Image.asset(
              currentIndex == 1
                  ? 'assets/images/search_active.png'
                  : 'assets/images/search_non.png',
              width: 20,
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Perpustakaan()),
                  (route) => false);
            },
            child: Image.asset(
              currentIndex == 2
                  ? 'assets/images/library_active.png'
                  : 'assets/images/library_non.png',
              width: 20,
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Tulis()),
                  (route) => false);
            },
            child: Image.asset(
              currentIndex == 3
                  ? 'assets/images/tulis_active.png'
                  : 'assets/images/tulis_non.png',
              width: 20,
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                  (route) => false);
            },
            child: Image.asset(
              currentIndex == 4
                  ? 'assets/images/profile_active.png'
                  : 'assets/images/profile_non.png',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
