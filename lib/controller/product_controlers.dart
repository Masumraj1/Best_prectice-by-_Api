import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ProductController extends GetxController{
  var products = [].obs;
  // RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }
  Future fetchProduct() async{
    try{
      final url = Uri.parse("https://demo.alorferi.com/api/products");

          var response = await http.get(url);

      if(response.statusCode == 200){
        Map productsData = jsonDecode(response.body);
        products.value = productsData["data"];
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