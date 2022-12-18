import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ALULA - LOGIN'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: 400,
              height: 250,
              child: Lottie.asset('assets/lottie/lottie_login.json'),
            ),
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
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.prosesLogin(),
              child: Text("LOGIN"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text("Belum punya akun alula?")),
            TextButton(
              onPressed: () => Get.offAllNamed(Routes.REGISTER),
              child: Text(
                "Register Sekarang",
                style: TextStyle(color: appPurple),
              ),
            )
          ],
        ));
  }
}
