class User {
  int? id;
  String? email;
  String? namaPengguna;
  String? namaLengkap;
  String? fotoPengguna;
  int? karya;
  String? token;

  User({
    this.id,
    this.email,
    this.token,
    this.namaPengguna,
    this.namaLengkap,
    this.fotoPengguna,
    this.karya,
  });

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      token: json['token'],
      namaPengguna: json['user']['nama_pengguna'],
      namaLengkap: json['user']['nama_lengkap'],
      fotoPengguna: json['user']['foto_pengguna'],
      karya: json['user']['karya'],
    );
  }
}
