import 'package:fe_bookly/models/user.dart';

class Buku {
  int? id;
  String? cover;
  String? judul;
  String? deskripsi;
  User? user;

  Buku({
    this.id,
    this.cover,
    this.judul,
    this.deskripsi,
    this.user,
  });

  // function to convert json data to Buku model
  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      cover: json['cover'],
      judul: json['judu;'],
      deskripsi: json['deskripsi'],
      user: User(
        id: json['user']['id'],
      ),
    );
  }
}
