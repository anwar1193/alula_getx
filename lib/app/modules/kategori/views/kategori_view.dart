import 'package:alula_getx/app/modules/kategori/views/kategori_add.dart';
import 'package:alula_getx/app/modules/widgets_general/menu_atas.dart';
import 'package:alula_getx/const/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ALULA - Kategori'),
          // centerTitle: true,
        ),
        drawer: MenuAtas(),
        body: FutureBuilder(
          future: controller.getAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.allCategory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        "${controller.allCategory[index]['nama_kategori']}",
                      ),
                      subtitle: Text(
                        "${controller.allCategory[index]['kode_kategori']}",
                      ),
                      trailing: IconButton(
                        onPressed: () => Get.defaultDialog(
                          contentPadding: EdgeInsets.all(20),
                          title: "Apakah anda yakin?",
                          barrierDismissible: false,
                          content: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.hapusKategori(
                                          controller.allCategory[index]['id']);
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
          onPressed: () => Get.to(KategoriAdd()),
          child: Icon(Icons.add),
          backgroundColor: appPurple,
        ));
  }
}
