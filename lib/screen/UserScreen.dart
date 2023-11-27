import 'package:api_best_prectice/controller/usercontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constant/urls.dart';
import '../controller/product_controlers.dart';

class UserScreen extends StatelessWidget {
   UserScreen({super.key});
  var controler = Get.put(UserController());


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
          var product =controler.userlist.value[index];
          return ListTile(
            title: SizedBox(
              height: 100,
              child: CachedNetworkImage(
                imageUrl: Urls.apiServerBaseUrl+ product['url'],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          );
        },
        itemCount: controler.userlist.value.length,
      ),),
    );
  }
}
