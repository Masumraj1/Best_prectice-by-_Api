// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// void main (){
//   runApp(MyApp());
// }
// class MyApp extends StatefulWidget {
//    MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//    TextEditingController emailcontroller= TextEditingController();
//    TextEditingController passwordcontroller = TextEditingController();
//
//    void login (String email,password)async{
//      try{
//        Response response = await post(
//           Uri.parse('https://demo.alorferi.com/oauth/token'),
//         body: {
//           {
//             "grant_type": "password",
//             "client_id": "2",
//             "client_secret":"Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
//             "username":"$email",
//             "password": "$password"
//           }
//         }
//         );
//         print(response.body);
//         if(response.statusCode==200){
//           var data = jsonDecode(response.body.toString());
//           print(data);
//           print('Accound succesfull login');
//         }else{
//           print('failed');
//         }
//      }catch(e){
//          print(e.toString());
//      }
//    }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar:  AppBar(title: Text('Sign In'),),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailcontroller,
//               decoration: InputDecoration(
//                 hintText: 'Email'
//               ),
//             ),
//             TextFormField(
//               controller: passwordcontroller,
//               decoration: InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: (){
//              login(emailcontroller.text.toString(),passwordcontroller.text.toString());
//                 },
//                 child: Text('Sign In'))
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';
import 'ProductScreen.dart';



class LoginApi extends StatefulWidget {
  LoginApi({Key? key}) : super(key: key);

  @override
  State<LoginApi> createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse( "${Urls.apiServerBaseUrl}${Endpoints.outhToken}"),
        body: {
          "grant_type": "password",
          "client_id": "2",
          "client_secret": "Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
          "username": email,
          "password": password,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Account successfully logged in');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen(data)),
        );
      } else {
        print('Login failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sign In'),centerTitle: true,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
