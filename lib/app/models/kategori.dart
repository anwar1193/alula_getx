// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

Kategori? kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori? data) => json.encode(data!.toJson());

class Kategori {
  Kategori({
    this.id,
    this.kodeKategori,
    this.namaKategori,
    this.keterangan,
  });

  String? id;
  String? kodeKategori;
  String? namaKategori;
  String? keterangan;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        kodeKategori: json["kode_kategori"],
        namaKategori: json["nama_kategori"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_kategori": kodeKategori,
        "nama_kategori": namaKategori,
        "keterangan": keterangan,
      };
}
