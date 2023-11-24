import 'package:api_best_prectice/controller/product_controlers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {

  ProductControler controler=Get.put(ProductControler());
   ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product list'),),
      body: ListView.builder(itemBuilder: (context,index){
          var product =controler.ProductList[index];
          return ListTile(
           title:Obx(() =>Text(product.name)),
            subtitle:Obx(()=> Text(product.price.toString())),
          );
      },
      itemCount: controler.ProductList.length,
      ),

    );
  }
}
