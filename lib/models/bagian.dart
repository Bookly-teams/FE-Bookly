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
      judulBagian: json['judul_bagian'],
      isi: json['isi'],
      tanggalPublikasi: json['tanggal_publikasi'],
      buku: json['buku'] != null
          ? Buku(id: json['buku']['id'] ?? json['buku_id'])
          : null,
    );
  }

  // Tambahkan method toJson untuk keperluan serialisasi
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judulBagian': judulBagian,
      'isi': isi,
      'tanggalPublikasi': tanggalPublikasi,
      'buku': buku?.id,
    };
  }
}
