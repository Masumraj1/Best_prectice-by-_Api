import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';
import 'login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    void login(String name, String email, String password,  String confirmpassword) async {
      try {
        http.Response response = await http.post(
            Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.registers}"),
            body:{
              "name" : name,
              "email":  email,
              "password": password,
              "password_confirmation": confirmpassword
            }
        );
        print(response.body);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          print(data);
          print('Account Created successfully ');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          print('create failed');
        }
      } catch (e) {
        print(e.toString());
      }
    }

    TextEditingController namecontroller =TextEditingController();
    TextEditingController emailcontroller =TextEditingController();
    TextEditingController passwordcontroller =TextEditingController();
    TextEditingController confirmpasswordcontroller =TextEditingController();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(
                height: 180,
                child: Center(
                    child: Image.asset(
                      "assets/signup.png",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                  height: 50,
                  child: Text(
                    "Registration ",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF431c53)),
                  )),
              Text('Create an account, Its free '),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(onPressed: (){
                    // login(namecontroller.text.toString(),
                    //   emailcontroller.text.toString(),
                    //   passwordcontroller.text.toString(),
                    //   confirmpasswordcontroller.text.toString()
                    // );
                  }, child: Text('SignUp'))),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: SafeArea(
                        child: Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                          child: Text(
                            'Signin',
                            style:
                            TextStyle(fontSize: 25, color: Colors.purple,fontWeight: FontWeight.bold),
                          ))),
                ],
              )


            ],
          ),
        ));
  }
}
