import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'introduction_footer.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
            title: "ALULA - POS Online System",
            body: "Mengelola bisnis jadi lebih mudah",
            image: Center(
              child: Container(
                width: 400,
                height: 250,
                child: Lottie.asset('assets/lottie/lottie1.json'),
              ),
            ),
            footer: IntroductionFooter(),
          ),
          PageViewModel(
            title: "ALULA - POS Online System",
            body: "Bertransaksi hanya dengan tiga klik",
            image: Center(
              child: Container(
                width: 400,
                height: 250,
                child: Lottie.asset('assets/lottie/lottie2.json'),
              ),
            ),
            footer: IntroductionFooter(),
          ),
          PageViewModel(
            title: "ALULA - POS Online System",
            body: "Pantau bisnis dari mana saja kapan saja",
            image: Center(
              child: Container(
                width: 400,
                height: 250,
                child: Lottie.asset('assets/lottie/lottie3.json'),
              ),
            ),
            footer: IntroductionFooter(),
          ),
        ],
        showSkipButton: true,
        showNextButton: false,
        skip: const Text("Skip"),
        done: const Text("Done"),
        onDone: () {
          Get.offNamed(Routes.REGISTER);
        });
  }
}
