

import 'package:api_best_prectice/constant/urls.dart';
import 'package:api_best_prectice/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/user_list_controller.dart';
import '../controller/user_product_controlers.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen(data, {super.key});

  var controler = Get.put(UserController());

  @override
  void initState() {
    controler;
  }

  @override
  Widget build(BuildContext context) {
    // bool shouldLoadImage = true;

    return Scaffold(
        drawer: MyDrawer(),

        appBar: AppBar(
          title: Text('User List'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Obx(() =>
            Card(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (contaxt, index) {
                  var product = controler.userlist.value[index];

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
                          child:
                          product['url']==null?
                          Image.network('https://demo.alorferi.com/images/blank_product_picture.png')
                              :
                          Image.network(Urls.apiServerBaseUrl+product['url']),

                        ),
                        Expanded(
                            flex: 3,
                            child: Text("Name:${product['name']}")),

                        // Text('${product['stock_quantity']}')
                      ],
                    )
                    ,
                  );
                },
                itemCount: controler.userlist.value.length,
              ),
            ))

    );
  }
}
