import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GantiKataSandiPage extends StatefulWidget {
  const GantiKataSandiPage({Key? key}) : super(key: key);

  @override
  _GantiKataSandiPageState createState() => _GantiKataSandiPageState();
}

class _GantiKataSandiPageState extends State<GantiKataSandiPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _updatePassword() async {
    setState(() => _isLoading = true);
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    try {
      final response = await http.post(
        Uri.parse('https://api.example.com/change-password'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer <TOKEN>',
        },
        body: jsonEncode({
          'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirmation': confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kata sandi berhasil diubah')),
        );
        Navigator.pop(context);
      } else if (response.statusCode == 401) {
        setState(() {
          _errorMessage = 'Password saat ini salah';
        });
      } else if (response.statusCode == 422) {
        setState(() {
          _errorMessage = 'Konfirmasi password baru tidak sesuai';
        });
      } else {
        final responseData = jsonDecode(response.body);
        setState(() {
          _errorMessage =
              responseData['message'] ?? 'Gagal mengubah kata sandi';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan jaringan, coba lagi';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Ubah Kata Sandi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Plus Jakarta Sans'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabelAndPasswordField(
              label: 'Kata Sandi Sekarang',
              controller: _currentPasswordController,
              hint: 'Masukkan kata sandi sekarang',
            ),
            const SizedBox(height: 20),
            _buildLabelAndPasswordField(
              label: 'Kata Sandi Baru',
              controller: _newPasswordController,
              hint: 'Masukkan kata sandi baru',
            ),
            const SizedBox(height: 20),
            _buildPasswordRequirements(),
            const SizedBox(height: 20),
            _buildLabelAndPasswordField(
              label: 'Konfirmasi Kata Sandi',
              controller: _confirmPasswordController,
              hint: 'Masukkan kembali kata sandi baru',
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                ),
              ),
            const SizedBox(height: 20),
            Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _updatePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 228, 177, 240),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 106, 35, 150),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelAndPasswordField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color.fromARGB(255, 249, 239, 255),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordRequirements() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Kata sandi Anda tidak memenuhi persyaratan.',
            style: TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Plus Jakarta Sans'),
          ),
          SizedBox(height: 8),
          Text(
            'Persyaratan kata sandi:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Plus Jakarta Sans'),
          ),
          SizedBox(height: 4),
          Text(
            '- Harus berisi angka, karakter khusus, serta huruf kecil dan besar\n'
            '- Panjang minimal 10 karakter\n'
            '- Tidak boleh berisi nama pengguna atau nama Anda',
            style: TextStyle(fontSize: 12, fontFamily: 'Plus Jakarta Sans'),
          ),
        ],
      ),
    );
  }
}
