// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fe_bookly/pages/create_buku.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:fe_bookly/components/story_card.dart';

class Tulis extends StatelessWidget {
  const Tulis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tulis',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 2,
                  fontFamily: 'Plus Jakarta Sans',
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => CreateBuku()),
                          (route) => false);
                    },
                    child: const NewStoryCard(),
                  ),
                ],
              ),
              const Spacer(),
              const CustomNavigationBar(
                currentIndex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
