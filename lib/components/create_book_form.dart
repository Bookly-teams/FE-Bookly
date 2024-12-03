// lib/components/create_book_form.dart
import 'package:flutter/material.dart';
import 'package:fe_bookly/components/add_chapter.dart';

class CreateBookForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String, String) onSubmit;

  const CreateBookForm({
    super.key,
    required this.formKey,
    required this.onSubmit,
  });

  @override
  State<CreateBookForm> createState() => _CreateBookFormState();
}

class _CreateBookFormState extends State<CreateBookForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: titleController,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Judul cerita',
        hintStyle: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF1D1D1D),
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: descriptionController,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Deskripsi cerita',
        hintStyle: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF1D1D1D),
        ),
      ),
    );
  }

  Widget _buildAddChapterButton() {
    return Center(
      child: AddChapterButton(
        onPressed: () {
          if (widget.formKey.currentState!.validate()) {
            widget.onSubmit(
              titleController.text,
              descriptionController.text,
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleField(),
            const SizedBox(height: 119),
            _buildDescriptionField(),
            const SizedBox(height: 269),
            _buildAddChapterButton(),
          ],
        ),
      ),
    );
  }
}
