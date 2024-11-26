import 'package:flutter/material.dart';
import 'package:fe_bookly/pages/daftar.dart';

class Daftar2 extends StatefulWidget {
  const Daftar2({super.key});

  @override
  _Daftar2State createState() => _Daftar2State();
}

class _Daftar2State extends State<Daftar2> {
  bool _checkboxValue = false;
  bool _passwordVisibility1 = false;
  bool _passwordVisibility2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: SizedBox(
                      width: 295,
                      child: TextFormField(
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: SizedBox(
                      width: 295,
                      child: TextFormField(
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
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12, 14, 0, 14),
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
                          // Add registration logic here
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
        ],
      ),
    );
  }
}
