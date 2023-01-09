import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaksi_controller.dart';
import '../../widgets_general/currency.dart';

class TransaksiCheckout extends GetView<TransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: controller.jumlahDataCheckout == '0'
          ? Center(
              child: Text("Belum ada data di keranjang"),
            )
          : FutureBuilder(
              future: controller.getCheckout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap:
                              true, // Supaya dibawah/diatas listview bisa ditambahkan widget lain
                          itemCount: controller.allCheckout.length,
                          itemBuilder: (context, index) {
                            var hargaJual = CurrencyFormat.convertToIdr(
                                int.parse(
                                    controller.allCheckout[index]['harga']));
                            var subtotal = CurrencyFormat.convertToIdr(
                                int.parse(
                                    controller.allCheckout[index]['total']));

                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  backgroundImage: NetworkImage(
                                    "${server1}/alula/file_upload/${controller.allCheckout[index]['files']}",
                                  ),
                                ),
                                title: Text(
                                  "${controller.allCheckout[index]['nama_barang']}",
                                ),
                                subtitle: Text(
                                  "${hargaJual} x ${controller.allCheckout[index]['qty']}",
                                ),
                                trailing: Container(
                                  child: Text(
                                    "${subtotal}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "TOTAL : ${CurrencyFormat.convertToIdr(int.parse(controller.totalCheckout))}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 80),
                            child: TextField(
                              controller: controller.jumlahBayarC,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Jumlah Bayar",
                                  contentPadding: EdgeInsets.all(20)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller
                                    .simpanTransaksi(controller.totalCheckout);
                              },
                              child: Text("Simpan Transaksi")),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
    );
  }
}
