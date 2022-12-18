import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  var isiHome = Text("Hai");

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
