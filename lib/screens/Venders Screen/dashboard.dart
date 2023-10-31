import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widgets/card_slider.dart';
import '../../widgets/flutter_custom_carousel_slider.dart';
import 'createStoreScreen.dart';
import 'graphOrder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        child: Column(
          children: [
            Text(
              "Hey, SM Shah",
              style: TextStyle(
                color: Color.fromARGB(206, 79, 79, 78),
                fontFamily: AutofillHints.familyName,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            // CardSliderWidget(),
            CorauselCustom(),
            SizedBox(
              height: 30,
            ),
            GraphOrder(),
          ],
        ),
      ),
    );
  }
}
