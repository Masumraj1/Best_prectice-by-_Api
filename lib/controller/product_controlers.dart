import 'dart:convert';

import 'package:api_best_prectice/constant/endpoint.dart';
import 'package:api_best_prectice/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/urls.dart';

class ProductControler extends GetxController {

  var ProductList = <Product>[].obs;


  @override
  void onInit(){
    super.onInit();
    fetchProductList();
  }


  Future<void> fetchProductList() async {

    try {
      var url = Uri.parse("${Urls.apiServerBaseUrls}{Endpoint.products}" );

      var response = await http.get(url);

      if (response.statusCode == 200) {

           Map<String,dynamic>dataMap=   jsonDecode(response.body);

           List<dynamic>jsonList=dataMap['data'];

           for (var element in jsonList) {
             ProductList.value.add(Product(
                 id: element['id'],
                 name: element['name'],
                 price: element['price']
             ));
           }
      }
    }catch(e,s){
      print('error:$e,strack trace:$s');
    }
    }
  }