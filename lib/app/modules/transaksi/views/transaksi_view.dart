import 'package:alula_getx/app/modules/transaksi/views/transaksi_checkout.dart';
import 'package:alula_getx/app/modules/widgets_general/currency.dart';
import 'package:alula_getx/const/color.dart';
import 'package:alula_getx/const/koneksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaksi_controller.dart';
import '../../widgets_general/menu_atas.dart';

// ignore: must_be_immutable
class TransaksiView extends GetView<TransaksiController> {
  // var data = 1;
  // var trans_page;
  @override
  Widget build(BuildContext context) {
    final transC = Get.put(TransaksiController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: AppBar(
          title: Text("Alula - Transaksi"),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (value) {},
                cursorColor: appPurple,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  hintText: "Search products",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      Icons.search,
                      color: appPurple,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.purple,
                ),
                padding: EdgeInsets.only(right: 0),
                child: IconButton(
                  onPressed: () {
                    Get.to(TransaksiCheckout());
                    controller.allCheckout = [];
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
            Center(
              child: FutureBuilder(
                future: controller.getJumlahCheckout(),
                builder: (context, snapshot) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 20,
                    height: 20,
                    color: appGreen,
                    child:
                        Center(child: Text('${controller.jumlahDataCheckout}')),
                  );
                },
              ),
            )
          ],
        ),
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
              shrinkWrap: true,
              itemCount: controller.allProduct.length,
              itemBuilder: (context, index) {
                var hargaJual = CurrencyFormat.convertToIdr(
                    int.parse(transC.allProduct[index]['harga_jual']));
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage: NetworkImage(
                          "${server1}/alula/file_upload/${transC.allProduct[index]['files']}"),
                    ),
                    title: Text("${transC.allProduct[index]['nama_barang']}"),
                    subtitle: Text(
                      "${hargaJual}",
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.defaultDialog(
                        contentPadding: EdgeInsets.all(20),
                        title: "${transC.allProduct[index]['nama_barang']}",
                        content: Column(
                          children: [
                            TextField(
                              controller: controller.qtyC,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Jumlah",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.addCart(
                                  transC.allProduct[index]['id'],
                                  transC.allProduct[index]['harga_jual'],
                                );
                                if (transC.qtyC.text != '') {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Add to cart"),
                            )
                          ],
                        ),
                      ),
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
