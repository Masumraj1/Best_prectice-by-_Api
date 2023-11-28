import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
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
                    decoration: InputDecoration(
                      labelText: 'Your Email',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(onPressed: (){}, child: Text('SignUp'))),
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
          ),
        ));
  }
}
