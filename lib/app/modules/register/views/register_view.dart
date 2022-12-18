import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Daftar Akun",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            "Daftar sekarang, dapatkan gratis 14 hari",
          ),
          SizedBox(height: 40),
          TextField(
            controller: controller.namaC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Nama Lengkap",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: controller.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: controller.notelpC,
            autocorrect: false,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Nomor Telepon",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          Obx(
            () => TextField(
              controller: controller.passC,
              autocorrect: false,
              obscureText: controller.isHidden.value,
              decoration: InputDecoration(
                labelText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.isHidden.toggle(),
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              controller.register();
            },
            child: Text("REGISTER NOW"),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Text("Sudah punya akun alula?")),
          TextButton(
            onPressed: () => Get.offAllNamed(Routes.LOGIN),
            child: Text(
              "Login Disini",
              style: TextStyle(color: appPurple),
            ),
          )
        ],
      ),
    );
  }
}
