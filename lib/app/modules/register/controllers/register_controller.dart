import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import '../../../../const/koneksi.dart';

class RegisterController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController notelpC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = true.obs;

  void register() async {
    if (namaC.text == '' ||
        emailC.text == '' ||
        notelpC.text == '' ||
        passC.text == '') {
      Get.defaultDialog(
        title: "Kesalahan!",
        middleText: "Harap Isi Semua Data",
      );
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("${server1}/alula/api/user/add"),
        body: {
          "nama_lengkap": namaC.text,
          "email": emailC.text,
          "nomor_telepon": notelpC.text,
          "password": passC.text
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      if (data['status'] == true) {
        Get.defaultDialog(
          barrierDismissible: false,
          title: "Register Sukses!",
          middleText: "Data berhasil di daftarkan",
          actions: [
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.LOGIN),
              child: Text("To Login Page"),
            )
          ],
        );
      }
    }
  }
}
