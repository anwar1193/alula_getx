import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as myhttp;

class HomeController extends GetxController {
  List<Map<String, dynamic>> allProduct = [];
  RxInt currentIndex = 0.obs;
  var isiHome = Text("Hai");

  void changeIndex(int index) {
    currentIndex.value = index;
  }

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
}
