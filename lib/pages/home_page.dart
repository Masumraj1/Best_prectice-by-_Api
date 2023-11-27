import 'package:flutter/material.dart';

import '../screen/ProductScreen.dart';
import '../screen/UserScreen.dart';

class ProductListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('User List'),centerTitle: true,),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  UserScreen(),
                      ),
                    );
                  }, child: Text('UserList')),
                  ElevatedButton(onPressed: (){  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  ProductScreen(),
                    ),
                  );}, child: Text('ProductList')),
                  ElevatedButton(onPressed: (){}, child: Text('MyList'))
                ],
              ),
            )
          ],

        )

    );
  }
}
