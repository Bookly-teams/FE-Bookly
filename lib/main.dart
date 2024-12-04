import 'package:fe_bookly/pages/beranda.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/masuk.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      home: Beranda(),
      initialRoute: '/',
    );
  }
}
