import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';
class ProductController extends GetxController{
  var productList = [].obs;
  // RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }
  Future fetchProduct() async{
    try{
      var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.products}");

          var response = await http.get(url);

      if(response.statusCode == 200){
        Map <String,dynamic>productsData = jsonDecode(response.body);
        productList.value = productsData["data"];
        // print("product fetch successful $products");
      }

      else{
        print("product fact");
      }
    }catch(e){
      print("error:masum error $e");
    }
  }
}