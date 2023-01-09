import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../widgets_general/menu_atas.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
        ),
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.KATEGORI),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    // Sumber Gambar : https://icon666.com/
                    image: AssetImage("assets/icon/kategori.png"),
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "KATEGORI",
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.PRODUK),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage("assets/icon/product.png"),
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PRODUK",
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.CUSTOMER),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage("assets/icon/pelanggan.png"),
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CUSTOMER",
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage("assets/icon/supplier.png"),
                  width: 150,
                  height: 120,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "SUPPLIER",
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.TRANSAKSI),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage("assets/icon/transaksi.png"),
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "TRANSAKSI",
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage("assets/icon/pengeluaran.png"),
                  width: 150,
                  height: 120,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "PENGELUARAN",
                )
              ],
            ),
          )
        ],
      ),
      Center(
        child: Text("Saldo"),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email : ${userdata.read('email')}"),
            Text("ID User : ${userdata.read('id')}"),
          ],
        ),
      ),
    ];
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('ALULA - Dashboard'),
          // centerTitle: true,
        ),
        drawer: MenuAtas(),
        body: widgets[controller.currentIndex.value],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: appPurple,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.money_off_rounded, title: 'Saldo'),
            TabItem(icon: Icons.person, title: 'User'),
          ],
          initialActiveIndex: 0,
          onTap: (index) {
            controller.changeIndex(index);

            // supaya saat kehalaman lain, lalu balik lagi, data tidak double
            controller.allProduct = [];
          },
        ),
      ),
    );
  }
}
