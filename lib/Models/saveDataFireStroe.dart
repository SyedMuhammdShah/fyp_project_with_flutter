import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SaveData {
  Future<String> UploadDataToFirebase(String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child(childName).child(DateTime.now().toString());
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    print('child Name: ' + childName);

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> SaveDataImage(
      {
      //required String name,

      required String firstName,
      required String secondName,
      required String email,
      required String password,
      required String userRole,
      required String city,
      required String storeName,
      // required PhoneNumber phoneNumber,
      required String selectedValue,
      required Uint8List file,
      required String v_user_id}) async {
    String resp = "some Error Occurred";
    try {
      String imageUrl = await UploadDataToFirebase('/user_profile', file);
      await firestore.collection('user_profile/').add({
        'v_first_name': firstName,
        'v_second_name': secondName,
        'v_user_id': v_user_id,
        'v_email': email,
        'v_password': password,
        'v_user_role': userRole,
        'v_store_city': city,
        'v_store_name': storeName,
        'v_password': password,
        // 'phoneNumber': phoneNumber,
        'v_imageLink': imageUrl,
      });
      resp = 'success';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

// factory SaveData.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;

//     return SaveData(
//       // Initialize the fields here using the data from the document
//       firstName: data['v_first_name'],
//       secondName: data['v_second_name'],
//       email: data['v_email'],
//       password: data['v_password'],
//       userRole: data['v_user_role'],
//       city: data['v_store_city'],
//       storeName: data['v_store_name'],
//       selectedValue: '', // You'll need to specify this
//       file: Uint8List(0), // You'll need to specify this
//       v_user_id: data['v_user_id'],
//     );
//   }
}
