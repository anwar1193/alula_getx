import 'dart:convert';

import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/produk_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../models/kategori.dart';
import 'package:http/http.dart' as myhttp;

class ProductAdd extends GetView<ProdukController> {
  String? idKategori;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.skuC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "SKU",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.barcodeC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Barcode",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.namaBarangC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Nama Barang",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<Kategori>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            showClearButton: true,

            // Jika dipilih, isi variable idKategori dengan id kategori terpilih
            // onChanged: (value) => idKategori = value?.id,
            onChanged: (value) =>
                controller.kategoriC.value = value?.namaKategori ?? "",

            // Custom tampilan hasil dropdown saat tidak memunculkan list data
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.namaKategori ?? "Belum Pilih Kategori"),

            // Custom tampilan list/data
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.namaKategori.toString()),
            ),

            // Ambil Data Ke API
            onFind: (text) async {
              var response =
                  await myhttp.get(Uri.parse("${server1}/alula/api/kategori"));

              List allKategori =
                  (json.decode(response.body) as Map<String, dynamic>)["data"];

              List<Kategori> allModelKategori = [];

              allKategori.forEach((element) {
                allModelKategori.add(Kategori(
                  id: element['id'],
                  namaKategori: element['nama_kategori'],
                ));
              });

              return allModelKategori;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.hargaBeliC,
            autocorrect: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Harga Beli",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.hargaJualC,
            autocorrect: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Harga Jual",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.stokC,
            autocorrect: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Stok",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => controller.simpanProduk(),
            child: Text("Simpan Produk"),
          )
        ],
      ),
    );
  }
}
