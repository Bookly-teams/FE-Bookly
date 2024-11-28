import 'package:flutter/material.dart';

class CreateBookForm extends StatefulWidget {
  const CreateBookForm({super.key});

  @override
  State<CreateBookForm> createState() => _CreateBookFormState();
}

class _CreateBookFormState extends State<CreateBookForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Judul cerita',
              hintStyle: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF1D1D1D),
              ),
            ),
          ),
          const SizedBox(height: 119),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Deskripsi cerita',
              hintStyle: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF1D1D1D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
