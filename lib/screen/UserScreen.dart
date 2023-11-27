import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/product_controlers.dart';

class UserScreen extends StatelessWidget {
   UserScreen({super.key});
  var controler = Get.put(ProductController());


  @override
  void initState() {
    // TODO: implement initState
    controler;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Obx(() => ListView.builder(
        itemBuilder: (context,index){
          var product =controler.products.value[index];
          return ListTile(
            title:Image.network(product['image'].toString()),
            subtitle: Text(product['name']),
          );
        },
        itemCount: controler.products.value.length,
      ),),
    );
  }
}
