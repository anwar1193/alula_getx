import 'dart:convert';

import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = true.obs;

  void prosesLogin() async {
    if (emailC.text == '' || passC.text == '') {
      Get.defaultDialog(
          title: "Kesalahan!", middleText: "Harap isi semua data");
    } else {
      var myResponse = await myhttp.post(
        Uri.parse("http://192.168.1.9:8080/alula/api/user/login"),
        body: {
          "email": emailC.text,
          "password": passC.text,
        },
      );

      Map<String, dynamic> data =
          jsonDecode(myResponse.body) as Map<String, dynamic>;

      if (data['status'] == true) {
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
