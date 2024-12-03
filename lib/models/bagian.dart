import 'package:fe_bookly/models/buku.dart';

class Bagian {
  int? id;
  String? judulBagian;
  String? isi;
  Buku? buku;
  String? tanggalPublikasi;
  int? totalBagian;

  Bagian({
    this.id,
    this.judulBagian,
    this.isi,
    this.buku,
    this.tanggalPublikasi,
  });

  // function to convert json data to Buku model
  factory Bagian.fromJson(Map<String, dynamic> json) {
    return Bagian(
      id: json['id'],
      judulBagian: json['judulBagian'],
      isi: json['isi'],
      tanggalPublikasi: json['tanggalPublikasi'],
      buku: json['buku'] != null
          ? Buku(id: json['buku']['id'] ?? json['buku_id'])
          : null,
    );
  }
}
