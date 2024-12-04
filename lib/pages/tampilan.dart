import 'package:flutter/material.dart';
import 'detail_buku.dart'; // Import DetailNovelPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novel App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DetailNovelPage(), // Arahkan ke halaman detail novel
    );
  }
}
