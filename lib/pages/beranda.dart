import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'library_screen.dart';
import 'create_screen.dart';
import 'profile_screen.dart';


class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    CreateScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9EFFF),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.search, 1),
              _buildNavItem(Icons.library_books, 2),
              _buildNavItem(Icons.create, 3),
              _buildNavItem(Icons.person, 4),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(
            icon,
            color: _currentIndex == index
                ? Color(0xFFE4B1F0) // Warna untuk ikon yang dipilih
                : Color(0xFF433878), // Warna untuk ikon yang tidak dipilih
          ),
          if (_currentIndex == index)
            Container(
              margin: EdgeInsets.only(top: 2),
              width: 30,
              height: 3,
              color: Color(0xFFE4B1F0), // Garis bawah untuk ikon yang dipilih
            ),
        ],
      ),
      label: '',
    );
  }
}
