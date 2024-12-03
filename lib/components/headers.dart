import 'package:flutter/material.dart';

Widget buildHeader({
  required BuildContext context,
  required String title,
  required Widget destination,
}) {
  return Container(
    constraints: const BoxConstraints(maxWidth: 480),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => destination),
                (route) => false);
          },
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 9),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
