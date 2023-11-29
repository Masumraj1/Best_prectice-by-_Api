import 'package:api_best_prectice/constant/urls.dart';
import 'package:api_best_prectice/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/user_product_controlers.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen(data, {super.key});

  var controler = Get.put(UserProductController());

  @override
  void initState() {
    controler;
  }

  @override
  Widget build(BuildContext context) {
    bool shouldLoadImage = true;

    return Scaffold(
        drawer: MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "cart"),
          ],
        ),
        appBar: AppBar(
          title: Text('All Product'),
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
                  var product = controler.userProductList.value[index];

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

                    // Image.network(Urls.apiServerBaseUrl+product['url']),
                    // CachedNetworkImage(
                    //   imageUrl: Urls.apiServerBaseUrl + product['url']??'',
                    //   placeholder: (context, url) =>
                    //       CircularProgressIndicator(),
                    //   // errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.white,),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Expanded(
                  flex: 3,
                  child: Text("Name:${product['name']}")),
                  Expanded(
                  flex: 1,
                  child: Text("Price:${product['price']}")),
                  // Text('${product['stock_quantity']}')
                  ],
                  )
                  ,
                  );
                },
                itemCount: controler.userProductList.value.length,
              ),
            ))
      // Obx(() => ListView.builder(
      //   itemBuilder: (context,index){
      //     var product =controler.productList.value[index];
      //     return ListTile(
      //       title:SizedBox(
      //         height: 100,
      //         width: double.infinity,
      //         child: CachedNetworkImage(
      //           imageUrl: Urls.apiServerBaseUrl+ product['url'],
      //           placeholder: (context, url) => CircularProgressIndicator(),
      //           errorWidget: (context, url, error) => Icon(Icons.error),
      //         ),
      //       ),
      //       // title: Text(product['url']),
      //       subtitle: Text(product['name']),
      //     );
      //   },
      //   itemCount: controler.productList.value.length,
      // ),),
    );
  }
}
