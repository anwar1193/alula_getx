import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionFooter extends StatelessWidget {
  const IntroductionFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () => Get.offAllNamed(Routes.REGISTER),
          child: Text("Buat akun baru gratis"),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Sudah punya akun alula?"),
        SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () => Get.offAllNamed(Routes.LOGIN),
          child: Text(
            "Masuk Disini",
            style: TextStyle(color: appPurple),
          ),
        )
      ],
    );
  }
}
