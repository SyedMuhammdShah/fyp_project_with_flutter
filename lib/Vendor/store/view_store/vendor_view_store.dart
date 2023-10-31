import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/Vendor/store/create_store_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Client/fitness_app_theme.dart';

class VendorViewStore extends StatefulWidget {
  const VendorViewStore({super.key});

  @override
  State<VendorViewStore> createState() => _VendorViewStoreState();
}

class _VendorViewStoreState extends State<VendorViewStore> {
  @override
  Widget build(BuildContext context) {
    final UserId = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.edit_square),
              onPressed: () {
                Get.to(CreateStore());
              },
            ),
            // add more IconButton
          ],
        ),
        body: Stack(
          children: <Widget>[
            TopBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ));
  }

  Widget TopBarUI() {
    final UserId = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user_profile')
            .where('v_user_id', isEqualTo: UserId?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var userName = snapshot.data!.docs[index]['v_first_name'];
                String vendorImage = snapshot.data!.docs[index]['v_imageLink'];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 0, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(vendorImage),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${userName ?? 'Loading...'}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      letterSpacing: 1.2,
                                      color: FitnessAppTheme.darkerText,
                                    ),
                                  ),
                                  Text(
                                    'Karachi, Pakistan',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 7,
                                      letterSpacing: 1.2,
                                      color: FitnessAppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/saveIcon.png',
                                      height: 25,
                                    ),
                                    Image.asset('assets/images/loveIcon.png'),
                                  ],
                                )),
                              ),
                            ],
                          )),
                    ),
                  ],
                );
              });
        });
  }
}
