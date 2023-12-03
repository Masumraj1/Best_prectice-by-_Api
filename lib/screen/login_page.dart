// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart';
// // void main (){
// //   runApp(MyApp());
// // }
// // class MyApp extends StatefulWidget {
// //    MyApp({super.key});
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //    TextEditingController emailcontroller= TextEditingController();
// //    TextEditingController passwordcontroller = TextEditingController();
// //
// //    void login (String email,password)async{
// //      try{
// //        Response response = await post(
// //           Uri.parse('https://demo.alorferi.com/oauth/token'),
// //         body: {
// //           {
// //             "grant_type": "password",
// //             "client_id": "2",
// //             "client_secret":"Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
// //             "username":"$email",
// //             "password": "$password"
// //           }
// //         }
// //         );
// //         print(response.body);
// //         if(response.statusCode==200){
// //           var data = jsonDecode(response.body.toString());
// //           print(data);
// //           print('Accound succesfull login');
// //         }else{
// //           print('failed');
// //         }
// //      }catch(e){
// //          print(e.toString());
// //      }
// //    }
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar:  AppBar(title: Text('Sign In'),),
// //         body: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextFormField(
// //               controller: emailcontroller,
// //               decoration: InputDecoration(
// //                 hintText: 'Email'
// //               ),
// //             ),
// //             TextFormField(
// //               controller: passwordcontroller,
// //               decoration: InputDecoration(
// //                   hintText: 'Password'
// //               ),
// //             ),
// //             ElevatedButton(
// //                 onPressed: (){
// //              login(emailcontroller.text.toString(),passwordcontroller.text.toString());
// //                 },
// //                 child: Text('Sign In'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../constant/endpoint.dart';
// import '../constant/urls.dart';
// import 'ProductScreen.dart';
//
//
//
// class LoginApi extends StatefulWidget {
//   LoginApi({Key? key}) : super(key: key);
//
//   @override
//   State<LoginApi> createState() => _LoginApiState();
// }
//
// class _LoginApiState extends State<LoginApi> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   void login(String email, String password) async {
//     try {
//       http.Response response = await http.post(
//         Uri.parse( "${Urls.apiServerBaseUrl}${Endpoints.outhToken}"),
//         body: {
//           "grant_type": "password",
//           "client_id": "2",
//           "client_secret": "Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
//           "username": email,
//           "password": password,
//         },
//       );
//       print(response.body);
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print(data);
//         print('Account successfully logged in');
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProductScreen(data)),
//         );
//       } else {
//         print('Login failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Sign In'),centerTitle: true,),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                   hintText: 'Email'
//               ),
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 login(
//                   emailController.text.toString(),
//                   passwordController.text.toString(),
//                 );
//               },
//               child: Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:api_best_prectice/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';
import 'ProductScreen.dart';
import 'forget_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      setState(() {
        changeButton = false;
      });
    }
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void login(String email, String password) async {
      try {
        http.Response response = await http.post(
          Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.outhToken}"),
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SafeArea(
                child: Center(
                    child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                  height: 100,
                  child: Text(
                    "Welcome ",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF431c53)),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'User_Gmail',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                    // suffix: Text("@gmail.com"),
                  ),

                  keyboardType: TextInputType.name,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      labelText: 'User Password',
                      hintText: "Enter Your password",
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.chevron_right)),

                  keyboardType: TextInputType.name,
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotScreen()),
                        );
                      },
                      child: Text('Forgot Password?'))),
                ElevatedButton(onPressed: (){
                  login(emailcontroller.text.toString(),
                    passwordcontroller.text.toString(), );
                },
                    child: Text('Login',style: TextStyle(fontSize: 30),)),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Dont have account? ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  SignUp()),
                            );
                          },
                          child: Text(
                            'Create a new account',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
              // Expanded(
              //   flex: 1,
              //   child: Row(
              //     children: [
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Container(
                    //       height: 80,
                    //       child: Image.asset('assets/google.png'),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Container(
                    //       height: 50,
                    //       child: Image.asset('assets/facebook.png'),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Container(
                    //       height: 50,
                    //       width: double.infinity,
                    //       child: Image.asset('assets/twitter.png'),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
