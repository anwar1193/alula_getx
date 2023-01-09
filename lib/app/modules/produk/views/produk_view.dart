import 'package:alula_getx/app/modules/produk/views/produk_add.dart';
import 'package:alula_getx/app/modules/widgets_general/menu_atas.dart';
import 'package:alula_getx/const/color.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALULA - Produk'),
        // centerTitle: true,
      ),
      drawer: MenuAtas(),
      body: FutureBuilder(
        future: controller.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.allProduct.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage: NetworkImage(
                        "${server1}/alula/file_upload/${controller.allProduct[index]['files']}",
                      ),
                    ),
                    title: Text(
                      "${controller.allProduct[index]['nama_barang']}",
                    ),
                    subtitle: Text(
                      "${controller.allProduct[index]['kategori']}",
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.defaultDialog(
                        contentPadding: EdgeInsets.all(20),
                        title: "Apakah anda yakin?",
                        barrierDismissible: false,
                        content: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.hapusProduk(
                                      controller.allProduct[index]['id'],
                                    );
                                  },
                                  child: Text("Ya, Hapus"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(ProductAdd()),
        child: Icon(Icons.add),
        backgroundColor: appPurple,
      ),
    );
  }
}
