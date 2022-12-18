import 'package:alula_getx/app/routes/app_pages.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'home_kosong.dart';
import 'home_isi.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  var data = 0;
  var home_page;

  @override
  Widget build(BuildContext context) {
    if (data == 1) {
      home_page = HomeIsi();
    } else {
      home_page = HomeKosong();
    }
    List<Widget> widgets = [
      home_page,
      Center(
        child: Text("Saldo"),
      ),
      Center(
        child: Text("Pelanggan"),
      ),
    ];
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('ALULA'),
          // centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(30),
                width: double.infinity,
                height: 150,
                color: appPurple,
                child: Text(
                  "MAIN MENU",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.shopify_outlined),
                    title: Text("Transaksi Baru"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text("Riwayat Transaksi"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text("Rekap Kas"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.add_chart),
                    title: Text("Tambah Produk"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.data_exploration),
                    title: Text("Laporan"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Pengaturan"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Konfirmasi Logout",
                          middleText: "Apakah Anda Yakin?",
                          actions: [
                            ElevatedButton(
                              onPressed: () => Get.offAllNamed(Routes.LOGIN),
                              child: Text(
                                "Ya, Logout",
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel"),
                            )
                          ]);
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
        body: widgets[controller.currentIndex.value],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: appPurple,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.money_off_rounded, title: 'Saldo'),
            TabItem(icon: Icons.person, title: 'Pelanggan'),
          ],
          initialActiveIndex: 0,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
