import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCover extends StatefulWidget {
  const CreateCover({super.key});

  @override
  State<CreateCover> createState() => _CreateCoverState();
}

class _CreateCoverState extends State<CreateCover> {
  File? imageFile;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getImage();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 22),
        height: 154,
        color: const Color(0xFFF9EFFF),
        child: Row(
          children: [
            Container(
              width: 78,
              height: 110,
              decoration: BoxDecoration(
                image: imageFile == null
                    ? null
                    : DecorationImage(
                        image: FileImage(imageFile ?? File('')),
                        fit: BoxFit.cover),
                color: const Color(0xFFE4B1F0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/create_plus.png',
                  width: 24,
                  height: 24,
                  semanticLabel: 'Add Cover Icon',
                ),
              ),
            ),
            const SizedBox(width: 24),
            const Expanded(
              child: Text(
                'Tambahkan sampul',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
