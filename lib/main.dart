import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'const/color.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      title: "Alula",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
