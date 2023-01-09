import 'dart:convert';

import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;

class ProdukController extends GetxController {
  List<Map<String, dynamic>> allProduct = [];

  TextEditingController skuC = TextEditingController();
  TextEditingController barcodeC = TextEditingController();
  TextEditingController namaBarangC = TextEditingController();
  TextEditingController hargaBeliC = TextEditingController();
  TextEditingController hargaJualC = TextEditingController();
  TextEditingController stokC = TextEditingController();
  RxString kategoriC = "".obs;

  Future getAllProducts() async {
    try {
      var response =
          await myhttp.get(Uri.parse("${server1}/alula/api/product"));

      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];

      data.forEach((element) {
        allProduct.add(element);
      });
    } catch (e) {
      print("Terjadi kesalahan");
      print(e);
    }
  }

  void simpanProduk() async {
    if (skuC.text == '' ||
        barcodeC.text == '' ||
        namaBarangC.text == '' ||
        hargaBeliC.text == '' ||
        hargaJualC.text == '' ||
        stokC.text == '' ||
        kategoriC == '') {
      Get.snackbar(
        "Kesalahan!",
        "Harap isi semua data",
        backgroundColor: appRed,
        colorText: appWhite,
        duration: Duration(seconds: 2),
      );
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("${server1}/alula/api/product/add_product"),
        body: {
          "sku": skuC.text,
          "barcode": barcodeC.text,
          "nama_barang": namaBarangC.text,
          "kategori": kategoriC.value,
          "harga_beli": hargaBeliC.text,
          "harga_jual": hargaJualC.text,
          "stok": stokC.text
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      if (data['status'] == true) {
        Get.defaultDialog(
          title: "Berhasil!",
          middleText: "Produk berhasil disimpan",
          barrierDismissible: false,
          actions: [
            ElevatedButton(
              onPressed: () {
                allProduct = [];
                Get.offNamed(Routes.PRODUK);
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    }
  }

  void hapusProduk(id) async {
    var myResponse = await myhttp
        .delete(Uri.parse("${server1}/alula/api/product/delete/${id}"));

    Map<String, dynamic> data =
        jsonDecode(myResponse.body) as Map<String, dynamic>;

    if (data['status'] == true) {
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Product Berhasil Dihapus",
        barrierDismissible: false,
        actions: [
          ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.PRODUK),
              child: Text("OK")),
        ],
      );
    }
  }
}
