import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/models/user.dart';
import 'package:fe_bookly/pages/beranda.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/daftar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Daftar2 extends StatefulWidget {
  final String email;
  final String namaLengkap;
  final String namaPengguna;

  const Daftar2({
    super.key,
    required this.email,
    required this.namaLengkap,
    required this.namaPengguna,
  });

  @override
  _Daftar2State createState() => _Daftar2State();
}

class _Daftar2State extends State<Daftar2> {
  bool _checkboxValue = false;
  bool _passwordVisibility1 = false;
  bool _passwordVisibility2 = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _register() async {
    ApiResponse response = await register(
      widget.email,
      widget.namaLengkap,
      widget.namaPengguna,
      passwordController.text,
    );

    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.token ?? ' ');
    await prefs.setInt('id', user.id ?? 0);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Beranda(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Daftar(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Daftar',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF1D1D1D),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: SizedBox(
                      width: 295,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (val) => val!.isEmpty
                            ? 'Minimal 8 karakter untuk kata sandi'
                            : null,
                        obscureText: !_passwordVisibility1,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Kata Sandi',
                          hintStyle: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF1D1D1D),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFAD88C6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9EFFF),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12, 14, 0, 14),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFFAD88C6),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              _passwordVisibility1 = !_passwordVisibility1;
                            }),
                            child: Icon(
                              _passwordVisibility1
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFFAD88C6),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  child: SizedBox(
                    width: 295,
                    child: TextFormField(
                      controller: confirmPasswordController,
                      validator: (val) =>
                          val!.isEmpty ? 'Kata sandi anda tidak sesuai' : null,
                      obscureText: !_passwordVisibility2,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Konfirmasi Kata Sandi',
                        hintStyle: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF1D1D1D),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAD88C6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF9EFFF),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(12, 14, 0, 14),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFAD88C6),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(() {
                            _passwordVisibility2 = !_passwordVisibility2;
                          }),
                          child: Icon(
                            _passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFFAD88C6),
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  indent: 40,
                  endIndent: 40,
                  color: Color(0xFFAD88C6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        unselectedWidgetColor: const Color(0xFFAD88C6),
                      ),
                      child: Checkbox(
                        value: _checkboxValue,
                        onChanged: (newValue) => setState(() {
                          _checkboxValue = newValue!;
                        }),
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xFFAD88C6),
                        ),
                        activeColor: const Color(0xFFAD88C6),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        'Ya, saya telah membaca dan menyetujui \nKetentuan Layanan dan Kebijakan Privasi \nBookly.',
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                  child: SizedBox(
                    width: 295,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _register();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFAD88C6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Daftar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
