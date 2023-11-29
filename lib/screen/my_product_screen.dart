import 'package:api_best_prectice/constant/urls.dart';
import 'package:api_best_prectice/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/my-product-controller.dart';
import '../controller/user_list_controller.dart';
import '../controller/user_product_controlers.dart';

class MyProductScreen extends StatelessWidget {
  MyProductScreen(data, {super.key});

  var controler = Get.put(MyProduceController());

  @override
  void initState() {
    controler;
  }

  @override
  Widget build(BuildContext context) {
    print(controler);
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('My Product'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Obx(() => Card(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (contaxt, index) {
                  var product = controler.myProducelist.value[index];

                  return Container(
                    padding: EdgeInsets.all(15),
                    height: 800,
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: product['url'] == null
                              ? Image.network(
                                  'https://demo.alorferi.com/images/blank_product_picture.png')
                              : Image.network(
                                  Urls.apiServerBaseUrl + product['url']),
                        ),
                        Expanded(
                            flex: 3, child: Text("Name:${product['name']}")),
                        Expanded(
                            flex: 3, child: Text("Name:${product['price']}")),

                        // Text('${product['stock_quantity']}')
                      ],
                    ),
                  );
                },
                itemCount: controler.myProducelist.value.length,
              ),
            )));
  }
}
