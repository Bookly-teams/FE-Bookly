import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const Masuk(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      home: Masuk(),
    );
  }
}
