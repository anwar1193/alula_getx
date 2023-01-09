import 'package:alula_getx/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KategoriAdd extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Kategori"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.kodeKategoriC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Kode Kategori",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.namaKategoriC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Nama Kategori",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.keteranganKategoriC,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "Keterangan",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => controller.simpanCategory(),
            child: Text("Simpan Kategori"),
          )
        ],
      ),
    );
  }
}
