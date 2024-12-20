import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/home_screen.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: HomeScreen(),
                ),
                SizedBox(height: 24),
                CustomNavigationBar(
                  currentIndex: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
