import 'package:flutter/material.dart';
import 'package:fe_bookly/components/create_bagians_form.dart';
import 'package:fe_bookly/components/headers.dart';
import 'package:fe_bookly/pages/create_buku.dart';

class CreateBagian extends StatefulWidget {
  final int bukuId; // Changed from String to int

  const CreateBagian({
    super.key,
    required this.bukuId,
  });

  @override
  State<CreateBagian> createState() => _CreateBagianState();
}

class _CreateBagianState extends State<CreateBagian> {
  bool _loading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(
                    context: context,
                    title: 'Tambahkan Bagian',
                    destination: const CreateBuku(),
                  ),
                  Expanded(
                    child: CreateBagiansForm(
                      bukuId: widget.bukuId,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
