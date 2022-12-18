import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeKosong extends StatelessWidget {
  const HomeKosong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            child: Lottie.asset("assets/lottie/lottie_product.json"),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Anda belum memiliki produk untuk dijual",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "TAMBAH PRODUK",
            ),
          )
        ],
      ),
    );
  }
}
