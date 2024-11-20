import 'package:flutter/material.dart';
import 'package:fe_bookly/daftar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bookly',
      home: Daftar(),
    );
  }
}
