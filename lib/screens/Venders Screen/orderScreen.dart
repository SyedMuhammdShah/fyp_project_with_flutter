import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'createStoreScreen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 64, 215),
        title: Image.asset('assets/images/logo.png'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://hips.hearstapps.com/hmg-prod/images/gettyimages-693134468.jpg?crop=1xw:1.0xh;center,top&resize=1200:*'),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Create Store'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 2,
              )
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                Get.to(CreateStore());
              } else {}
            },
          )
        ],
      ),
      body: Container(
        child: Text("Order"),
      ),
    );
  }
}
