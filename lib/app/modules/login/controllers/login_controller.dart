import 'dart:convert';

import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  // Inisialisasi Session
  final userdata = GetStorage();

  RxBool isHidden = true.obs;

  void prosesLogin() async {
    String email = emailC.text;

    if (emailC.text == '' || passC.text == '') {
      Get.defaultDialog(
          title: "Kesalahan!", middleText: "Harap isi semua data");
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("${server1}/alula/api/user/login"),
        body: {
          "email": emailC.text,
          "password": passC.text,
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      var id_user = data['id'];

      if (data['status'] == true) {
        // Simpan Session Ke Get Storage
        userdata.write('isLogin', true);
        userdata.write('email', email);
        userdata.write('id', id_user);

        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Kesalahan!",
          middleText: "Kombinasi username & password salah",
        );
      }
    }
  }
}
