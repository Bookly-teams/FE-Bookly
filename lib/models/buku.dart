import 'package:fe_bookly/models/user.dart';

class Buku {
  int? id;
  String? cover;
  String? judul;
  String? deskripsi;
  User? user;
  int? totalBagian;

  Buku({
    this.id,
    this.cover,
    this.judul,
    this.deskripsi,
    this.user,
    this.totalBagian,
  });

  // function to convert json data to Buku model
  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      cover: json['cover'],
      judul: json['judul'],
      totalBagian: json['totalBagian'],
      deskripsi: json['deskripsi'],
      user: json['user'] != null
          ? User(id: json['user']['id'] ?? json['user_id'])
          : null,
    );
  }
}
