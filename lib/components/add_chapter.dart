import 'package:flutter/material.dart';

class AddChapterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddChapterButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF9EFFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/create_plus.png',
                width: 24,
                height: 24,
                semanticLabel: 'Add Chapter Icon',
              ),
              const SizedBox(width: 6),
              const Text(
                'Tambah Bab',
                style: TextStyle(
                  color: Color(0xFF433878),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
