import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          const CustomNavigationBar(
            currentIndex: 2,
          ),
        ],
      ),
    );
  }
}
