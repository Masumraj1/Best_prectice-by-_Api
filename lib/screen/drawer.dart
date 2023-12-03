import 'package:flutter/material.dart';

import 'User_List_Screen.dart';
import 'my_product_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyProductScreen('')),
                    );
                  },
                  child: Text('My Product')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  UserListScreen('')),
                    );
                  },
                  child: Text('UserList')),

            ],
          ),
        ),
      ),
    );
    ();
  }
}
