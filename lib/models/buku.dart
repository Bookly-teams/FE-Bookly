import 'package:fe_bookly/models/user.dart';
import 'package:fe_bookly/models/bagian.dart';

class Buku {
  int? id;
  String? cover;
  String? judul;
  String? deskripsi;
  User? user;
  int? totalBagian;
  String? namaPengguna;
  List<Bagian>? bagian; // Tambahkan properti bagian

  Buku({
    this.id,
    this.cover,
    this.judul,
    this.deskripsi,
    this.user,
    this.totalBagian,
    this.namaPengguna,
    this.bagian, // Tambahkan ke konstruktor
  });

  // function to convert json data to Buku model
  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      cover: json['cover'],
      judul: json['judul'],
      totalBagian: json['totalBagian'],
      deskripsi: json['deskripsi'],
      namaPengguna: json['nama_pengguna'],
      user: json['user'] != null
          ? (json['user'] as List)
              .map((userJson) => User.fromJson(userJson))
              .toList()
              .first
          : null,
      // Tambahkan parsing bagian jika ada di JSON
      bagian: json['bagian'] != null
          ? (json['bagian'] as List)
              .map((bagianJson) => Bagian.fromJson(bagianJson))
              .toList()
          : null,
    );
  }

  // Tambahkan method toJson untuk keperluan serialisasi
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cover': cover,
      'judul': judul,
      'deskripsi': deskripsi,
      'totalBagian': totalBagian,
      'user': user?.toJson(), // Asumsikan User memiliki method toJson()
      'bagian': bagian
          ?.map((b) => b.toJson())
          .toList(), // Asumsikan Bagian memiliki method toJson()
    };
  }
}
