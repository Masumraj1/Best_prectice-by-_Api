// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../constant/endpoint.dart';
// import '../constant/urls.dart';
//
// class MyProduceController extends GetxController {
//   var myProducelist = [].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchProduct();
//   }
//
//   Future fetchProduct() async{
//     try{
//       var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.myProduct}");
//
//       var response = await http.get(url);
//
//       if(response.statusCode == 200){
//         // Map productsData = jsonDecode(response.body);
//         // myProducelist.value = productsData["data"];
//         // print("product fetch successful $productsData");
//
//         Map<String, dynamic> headers = {
//           'Content-Type': 'Bearer', // Specify your content type
//           'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZjYwYWNiY2I5Yjk4OTI0YmRjMDkzMmI3ZTNmOTU2Njg0MGY1ZmJjMDY5Y2MyNGQwMTBhNTYwNmQ4M2ZhMTAxYTZjMjM5NGU0YjU4YjQ0YWEiLCJpYXQiOjE3MDA4MjY5NDcuNzcwMzk5LCJuYmYiOjE3MDA4MjY5NDcuNzcwNDAyLCJleHAiOjE3MzI0NDkzNDcuNzU3Mjc3LCJzdWIiOiJkMjM2OWU4Ni1hMDYyLTQ0ZDgtOWQ1My1kM2VjOTRkODcwMjciLCJzY29wZXMiOltdfQ.bEcxt8EqIvhpQmGdBUW6YqvjOel3fEKFDQfxxGY0giLN0WlB9VAF1Bq_B3Xgde6jzuHPPaCzGByUSLVFoGtoMN8VnqpJkN2VRTJVaon9JcwuPkxZuqiPqhc6-7diaqVhBEP05LlLAvbcB5zHiC6E57tExjfQU0maqRQqrD76-L40Y-glpBhQS1c11nIVHRLEWbGvVfhYfJBQ9vSGZr4y_2xFv-kEzXFvPy_hxudid_n5NKTBXH28v_rMAnEqRC3a0hJqs3GkV9EWt7BYRbdcclMG4pyQBBQtr7m2y9AxIn_OCXr_mV_nCqnyV92ALd4hlzC2RM45TlVJh5FaasB1gDrN0exqooajtK_pjomyMw6VIMMY73OdxwAjMhFFNJ55xEoBrChgWu_No85tHZknebgjephPpv3nkQ_3TiLY0-HqRcoI1uHp0pG4JcTlWAlN7VlW52k_LDu3AEUVXG4wC5TB_eJojTx922NMW14Si6JccqBAmbhYURrNopq0myizffNpZ6NrtPJqml_A4wtDwEzmYfxx8CVKRM3hVvZ7rjVsu1VJzoti2VAzzcvK8AG5aSpolj8thnyGFd_Os-bWrBrS5z76hL0RtPP-eNwkcxu4GWH0e0drpZq1tgD0njLr8gyoQrSglj7PJWIlpDP1IvkzmpIuZw5CJqpqbGTgYRU', // Example authorization header
//         };
//         print(headers);
//       }
//
//       else{
//         print("product fact");
//       }
//     }catch(e){
//       print("error:masum error $e");
//     }
//   }
// }



import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';


class MyProduceController extends GetxController {
  var myProducelist = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    try {
      var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.myProduct}");

      // Include your headers in the request
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json', // Adjust if needed
          'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZjYwYWNiY2I5Yjk4OTI0YmRjMDkzMmI3ZTNmOTU2Njg0MGY1ZmJjMDY5Y2MyNGQwMTBhNTYwNmQ4M2ZhMTAxYTZjMjM5NGU0YjU4YjQ0YWEiLCJpYXQiOjE3MDA4MjY5NDcuNzcwMzk5LCJuYmYiOjE3MDA4MjY5NDcuNzcwNDAyLCJleHAiOjE3MzI0NDkzNDcuNzU3Mjc3LCJzdWIiOiJkMjM2OWU4Ni1hMDYyLTQ0ZDgtOWQ1My1kM2VjOTRkODcwMjciLCJzY29wZXMiOltdfQ.bEcxt8EqIvhpQmGdBUW6YqvjOel3fEKFDQfxxGY0giLN0WlB9VAF1Bq_B3Xgde6jzuHPPaCzGByUSLVFoGtoMN8VnqpJkN2VRTJVaon9JcwuPkxZuqiPqhc6-7diaqVhBEP05LlLAvbcB5zHiC6E57tExjfQU0maqRQqrD76-L40Y-glpBhQS1c11nIVHRLEWbGvVfhYfJBQ9vSGZr4y_2xFv-kEzXFvPy_hxudid_n5NKTBXH28v_rMAnEqRC3a0hJqs3GkV9EWt7BYRbdcclMG4pyQBBQtr7m2y9AxIn_OCXr_mV_nCqnyV92ALd4hlzC2RM45TlVJh5FaasB1gDrN0exqooajtK_pjomyMw6VIMMY73OdxwAjMhFFNJ55xEoBrChgWu_No85tHZknebgjephPpv3nkQ_3TiLY0-HqRcoI1uHp0pG4JcTlWAlN7VlW52k_LDu3AEUVXG4wC5TB_eJojTx922NMW14Si6JccqBAmbhYURrNopq0myizffNpZ6NrtPJqml_A4wtDwEzmYfxx8CVKRM3hVvZ7rjVsu1VJzoti2VAzzcvK8AG5aSpolj8thnyGFd_Os-bWrBrS5z76hL0RtPP-eNwkcxu4GWH0e0drpZq1tgD0njLr8gyoQrSglj7PJWIlpDP1IvkzmpIuZw5CJqpqbGTgYRU',
        },
      );

      if (response.statusCode == 200) {
        Map<String,dynamic> productsData = jsonDecode(response.body);
        // print("Product fetch successful $productsData");
        myProducelist.value = productsData["data"];

      } else {
        print("Failed to fetch products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
