import 'package:alula_getx/app/modules/widgets_general/menu_atas.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALULA - Customer'),
        // centerTitle: true,
      ),
      drawer: MenuAtas(),
      body: Center(
        child: Text(
          'CustomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
