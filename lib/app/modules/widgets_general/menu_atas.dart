import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_pages.dart';
import '../../../../const/color.dart';

class MenuAtas extends StatelessWidget {
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                leading: Icon(Icons.dashboard),
                title: Text("Dashbord"),
                // trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.offAllNamed(Routes.HOME),
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.shopify_outlined),
                title: Text("Transaksi"),
                // trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.offAllNamed(Routes.TRANSAKSI),
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.data_exploration),
                title: Text("Laporan"),
                // trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Pengaturan"),
                // trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: appPurple),
                title: Text(
                  "Logout",
                  style: TextStyle(color: appPurple),
                ),
                onTap: () {
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: "Konfirmasi Logout",
                      middleText: "Apakah Anda Yakin?",
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // Hapus session tersimpan
                            userdata.write('isLogin', false);
                            userdata.remove('email');
                            userdata.remove('id');
                            Get.offAllNamed(Routes.LOGIN);
                          },
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
    );
  }
}
