import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

import 'package:alula_getx/const/koneksi.dart';

class HomeIsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());

    return FutureBuilder(
        future: homeC.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: homeC.allProduct.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(
                      "${server1}/alula/file_upload/${homeC.allProduct[index]['files']}"),
                ),
                title: Text("${homeC.allProduct[index]['nama_barang']}"),
                subtitle: Text("Rp ${homeC.allProduct[index]['harga_jual']}"),
              ),
            );
          }
        });
  }
}
