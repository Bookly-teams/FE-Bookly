import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenggunaProvider extends ChangeNotifier {
  String namaPengguna = "puanGacorrr";
  String namaLengkap = "puan maharani";
  String email = "puan_maharani2004@gmail.com";
  String kataSandi = "********";
  String? _fotoProfil;
  int jumlahKarya = 0;

  PenggunaProvider() {
    _loadFotoProfil();
  }

  String? get fotoProfil => _fotoProfil;

  get username => null;

  void ubahFotoProfil(String path) {
    _fotoProfil = path;
    notifyListeners();
  }

  Future<void> _loadFotoProfil() async {
    final prefs = await SharedPreferences.getInstance();
    _fotoProfil = prefs.getString('profile_image_path');
    notifyListeners();
  }
  
  void ubahNamaPengguna(String namaBaru) {
    namaPengguna = namaBaru;
    notifyListeners();
  }

  void ubahNamaLengkap(String namaBaru) {
    namaLengkap = namaBaru;
    notifyListeners();
  }

  bool ubahKataSandi(String kataSandiLama, String kataSandiBaru) {
    // Validasi kata sandi lama
    if (kataSandiLama != kataSandi) {
      throw Exception('Kata sandi lama tidak sesuai');
    }

    // Jika validasi berhasil, update kata sandi
    kataSandi = kataSandiBaru;
    notifyListeners();
    return true;
  }
}
