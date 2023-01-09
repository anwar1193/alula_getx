import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:convert';
import 'package:http/http.dart' as myhttp;

class TransaksiController extends GetxController {
  List<Map<String, dynamic>> allProduct = [];
  List<Map<String, dynamic>> allCheckout = [];
  late String totalCheckout;
  String? jumlahDataCheckout = '0';
  TextEditingController jumlahBayarC = TextEditingController();
  TextEditingController qtyC = TextEditingController();
  final userdata = GetStorage();

  String parameterSearch = '';

  Future getAllProducts() async {
    try {
      var response =
          await myhttp.get(Uri.parse("${server1}/alula/api/product"));
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];

      data.forEach((element) {
        allProduct.add(element);
      });
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  Future getJumlahCheckout() async {
    try {
      // Jumlah Checkout
      var response = await myhttp.get(Uri.parse(
          "${server1}/alula/api/transaksi/checkout/${userdata.read('id')}"));

      Map<String, dynamic> jumlahData =
          jsonDecode(response.body) as Map<String, dynamic>;

      jumlahDataCheckout = jumlahData['jumlah_data'].toString();
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  // Future getAllProducts(search) async {
  //   if (search == '') {
  //     parameterSearch = '';
  //     try {
  //       var response =
  //           await myhttp.get(Uri.parse("${server1}/alula/api/product"));
  //       List data =
  //           (json.decode(response.body) as Map<String, dynamic>)['data'];

  //       data.forEach((element) {
  //         allProduct.add(element);
  //       });
  //     } catch (e) {
  //       print("Terjadi Kesalahan");
  //       print(e);
  //     }
  //   } else {
  //     parameterSearch = search;
  //     try {
  //       var response = await myhttp.post(
  //         Uri.parse("${server1}/alula/api/product/nama_barang"),
  //         body: {"params": search},
  //       );

  //       List data =
  //           (json.decode(response.body) as Map<String, dynamic>)['data'];

  //       data.forEach((element) {
  //         allProduct.add(element);
  //       });
  //     } catch (e) {
  //       print("Terjadi Kesalahan");
  //       print(e);
  //     }
  //   }
  // }

  Future getCheckout() async {
    try {
      // ALL DATA CHECKOUT---------------------------------------------------
      var myResponse = await myhttp.get(Uri.parse(
          "${server1}/alula/api/transaksi/checkout/${userdata.read('id')}"));

      List data =
          (json.decode(myResponse.body) as Map<String, dynamic>)['data'];

      data.forEach((element) {
        allCheckout.add(element);
      });

      // Jumlah Checkout
      var response = await myhttp.get(Uri.parse(
          "${server1}/alula/api/transaksi/checkout/${userdata.read('id')}"));

      Map<String, dynamic> jumlahData =
          jsonDecode(response.body) as Map<String, dynamic>;

      jumlahDataCheckout = jumlahData['jumlah_data'].toString();

      // TOTAL CHECKOUT-------------------------------------------------------
      var myResponse_sum = await myhttp.get(Uri.parse(
          "${server1}/alula/api/transaksi/checkout_sum/${userdata.read('id')}"));

      Map<String, dynamic> data2 =
          jsonDecode(myResponse_sum.body) as Map<String, dynamic>;

      totalCheckout = data2['data'][0]['total'].toString();
    } catch (e) {
      print("Terjadi kesalahan");
      print(e);
    }
  }

  void addCart(var id_item, var harga) async {
    if (qtyC.text == '') {
      Get.snackbar(
        "Kesalahan!",
        "Anda belum masukkan jumlah",
        snackPosition: SnackPosition.TOP,
        backgroundColor: appRed,
        margin: EdgeInsets.only(top: 70),
        colorText: appWhite,
      );
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("${server1}/alula/api/transaksi/add_cart"),
        body: {
          "id_item": id_item,
          "harga": harga,
          "qty": qtyC.text,
          "user": userdata.read('id'),
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      if (data['status'] == true) {
        // Jika Berhasil
        // Get.snackbar(
        //   "Berhasil!",
        //   "Ditambahkan ke cart",
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: appGreen,
        //   margin: EdgeInsets.only(top: 70),
        //   colorText: appWhite,
        //   duration: Duration(seconds: 1),
        // );
        // qtyC.text = '';
        Get.offAllNamed(Routes.TRANSAKSI);
      }
    }
  }

  void simpanTransaksi(var totalBelanja) async {
    if (jumlahBayarC.text == '') {
      Get.snackbar(
        "Kesalahan!",
        "Anda belum masukan jumlah bayar",
        snackPosition: SnackPosition.TOP,
        backgroundColor: appRed,
        margin: EdgeInsets.only(top: 70),
        colorText: appWhite,
        duration: Duration(seconds: 2),
      );
    } else {
      var jumlahBayar = int.parse(jumlahBayarC.text);
      var totalBelanjaInt = int.parse(totalBelanja);
      var kembalian = jumlahBayar - totalBelanjaInt;

      if (jumlahBayar < totalBelanjaInt) {
        Get.snackbar(
          "Kurang Bayar!",
          "Nominal yang anda masukkan kurang bayar",
          snackPosition: SnackPosition.TOP,
          backgroundColor: appRed,
          margin: EdgeInsets.only(top: 70),
          colorText: appWhite,
          duration: Duration(seconds: 2),
        );
      } else {
        var myResponse = await myhttp.post(
          Uri.parse("${server1}/alula/api/transaksi/simpan_transaksi"),
          body: {
            "subtotal": totalBelanja,
            "grandtotal": totalBelanja,
            "cash": jumlahBayarC.text,
            "change": kembalian.toString(),
            "user": userdata.read('id'),
          },
        );

        Map<String, dynamic> data =
            jsonDecode(myResponse.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          Get.defaultDialog(
            title: "Transaksi Berhasil",
            middleText: "Uang Kembali : Rp ${kembalian}",
            barrierDismissible: false,
            actions: [
              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.TRANSAKSI),
                child: Text("Transaksi lagi"),
              ),
              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: Text("Ke Home"),
              ),
            ],
          );
        }
      }
    }
  }
}
