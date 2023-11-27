// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../constant/endpoint.dart';
// import '../constant/urls.dart';
// import '../models/product.dart';
//
//
// class UserController extends GetxController {
//   var productLists = <Product>[].obs;
//
//   @override
//   void onInit() {
//     fetchProductList();
//
//     super.onInit();
//   }
//
//   Future<void> fetchProductList() async {
//     try {
//       var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.users}");
//
//       var response = await http.get(url);
//
//       if (response.statusCode == 200) {
//
//         Map<String, dynamic> dataMap = jsonDecode(response.body);
//
//         List<dynamic> jsonList = dataMap['data'];
//
//         for (var element in jsonList) {
//           productLists.value.add(Product(
//             id: element['id'],
//             name: element['name'],
//             price: element['price'],
//             url: element['url'] ,
//           ));
//         }
//       }
//     } catch (e, s) {
//       print("error: $e, stack trace: $s");
//     }
//   }
// }




import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';
class UserController extends GetxController{
  var userlist = [].obs;
  // RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }
  Future fetchProduct() async{
    try{
      var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.users}");

      var response = await http.get(url);

      if(response.statusCode == 200){
        Map productsData = jsonDecode(response.body);
        userlist.value = productsData["data"];
        // print("product fetch successful $userlist");
      }

      else{
        print("product fact");
      }
    }catch(e){
      print("error:masum error $e");
    }
  }
}