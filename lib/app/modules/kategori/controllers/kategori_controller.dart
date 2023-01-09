import 'dart:convert';

import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;

class KategoriController extends GetxController {
  TextEditingController kodeKategoriC = TextEditingController();
  TextEditingController namaKategoriC = TextEditingController();
  TextEditingController keteranganKategoriC = TextEditingController();

  List<Map<String, dynamic>> allCategory = [];

  Future getAllCategory() async {
    try {
      var myResponse =
          await myhttp.get(Uri.parse("${server1}/alula/api/kategori"));

      List data =
          (json.decode(myResponse.body) as Map<String, dynamic>)['data'];

      data.forEach((element) {
        allCategory.add(element);
      });
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  void simpanCategory() async {
    if (kodeKategoriC.text == '' ||
        namaKategoriC.text == '' ||
        keteranganKategoriC.text == '') {
      Get.snackbar(
        "Kesalahan!",
        "Harap isi semua data",
        backgroundColor: appRed,
        colorText: appWhite,
        duration: Duration(seconds: 2),
      );
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("${server1}/alula/api/kategori/add_kategori"),
        body: {
          "kode_kategori": kodeKategoriC.text,
          "nama_kategori": namaKategoriC.text,
          "keterangan": keteranganKategoriC.text
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      if (data['status'] == true) {
        Get.defaultDialog(
          title: "Berhasil!",
          middleText: "Kategori berhasil disimpan",
          barrierDismissible: false,
          actions: [
            ElevatedButton(
              onPressed: () {
                allCategory = [];
                Get.offNamed(Routes.KATEGORI);
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    }
  }

  void hapusKategori(id) async {
    var myResponse = await myhttp
        .delete(Uri.parse("${server1}/alula/api/kategori/delete/${id}"));

    Map<String, dynamic> data =
        jsonDecode(myResponse.body) as Map<String, dynamic>;

    if (data['status'] == true) {
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Kategori Berhasil Dihapus",
        barrierDismissible: false,
        actions: [
          ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.KATEGORI),
              child: Text("OK")),
        ],
      );
    }
  }
}
