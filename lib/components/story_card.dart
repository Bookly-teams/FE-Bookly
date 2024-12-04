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
              image: DecorationImage(
                image: AssetImage('assets/images/create_plus.png'),
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Buat cerita baru',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
