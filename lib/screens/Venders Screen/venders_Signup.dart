import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fyp_project/screens/login_screen.dart';
import 'package:fyp_project/widgets/pickImage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../Models/saveDataFireStroe.dart';
import '../../Models/user_model.dart';
// import '../Models/user_model.dart';

class VenderSignUp extends StatefulWidget {
  const VenderSignUp({super.key});

  @override
  State<VenderSignUp> createState() => _SignUpScrennState();
}

class _SignUpScrennState extends State<VenderSignUp> {
  bool _loading = false;

  final List<String> items = ['Client', 'Vender'];
  String selectedValue = "Vendor";
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String firstName = "";
  String secondName = "";
  String userRole = "Vendor";
  String city = "";
  String storeName = "";
  late PhoneNumber phoneNumber;
  final auth = FirebaseAuth.instance;
  // final TextEditingController fullname = TextEditingController();
  // final TextEditingController email = TextEditingController();
  // final TextEditingController password = TextEditingController();
  // final TextEditingController phoneNumber = TextEditingController();
  // final TextEditingController selectedValue = TextEditingController();

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  Uint8List? _image;
  void selectImage() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    // ImagePicker imagePicker = ImagePicker();
    // // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print("image" + '${file?.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Background Image

            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/Logo.png',
                        width: 200,
                        //height: 100,
                      ),

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      "assets/images/user_logo.png"),
                                ),
                          Positioned(
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(Icons.add_a_photo_outlined),
                              color: Colors.white,
                            ),
                            bottom: -10,
                            // right: -10,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "First Name",
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      filled: true, //<-- SEE HERE
                                      fillColor:
                                          Color.fromARGB(68, 217, 216, 218),
                                      // border: UnderlineInputBorder(),

                                      hintText: "Muhammad",
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        firstName = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Email!");
                                      }
                                      // reg expression
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "Second Name",
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      filled: true, //<-- SEE HERE
                                      fillColor:
                                          Color.fromARGB(68, 217, 216, 218),
                                      // border: UnderlineInputBorder(),

                                      hintText: "Shah",
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        secondName = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Email!");
                                      }
                                      // reg expression
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Text("Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(68, 217, 216, 218),
                          // border: UnderlineInputBorder(),

                          hintText: "sv@gmail.com",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Email!");
                          }
                          // reg expression
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(68, 217, 216, 218),
                          // border: UnderlineInputBorder(),

                          hintText: "********",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Email!");
                          }
                          // reg expression
                        },
                      ),
                      SizedBox(height: 10),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Store Name"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(68, 217, 216, 218),
                          // border: UnderlineInputBorder(),

                          hintText: "abc pvt ltd",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            storeName = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Email!");
                          }
                          // reg expression
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Where Should Your Store be hosted?"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(68, 217, 216, 218),
                          // border: UnderlineInputBorder(),

                          hintText: "Karachi, Pakistan",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            city = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Email!");
                          }
                          // reg expression
                        },
                      ),
                      SizedBox(height: 10),
                      Text("Phone Number"),
                      SizedBox(height: 10),
                      IntlPhoneField(
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromARGB(68, 217, 216, 218),
                          // border: UnderlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        initialCountryCode: 'PK',
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                            print(phoneNumber);
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      // DropdownButtonHideUnderline(
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton2<String>(
                      //       isExpanded: true,
                      //       hint: Text(
                      //         'Select Type',
                      //         style: TextStyle(
                      //             fontSize: 14,
                      //             // color: Theme.of(context).hintColor,
                      //             color: Colors.black),
                      //       ),
                      //       items: _addDividersAfterItems(items),
                      //       value: selectedValue,
                      //       onChanged: (String? value) {
                      //         setState(() {
                      //           selectedValue = value;
                      //         });
                      //       },
                      //       buttonStyleData: const ButtonStyleData(
                      //         padding: EdgeInsets.symmetric(horizontal: 16),
                      //         height: 40,
                      //         width: 140,
                      //       ),
                      //       dropdownStyleData: const DropdownStyleData(
                      //         maxHeight: 200,
                      //       ),
                      //       menuItemStyleData: MenuItemStyleData(
                      //         padding:
                      //             const EdgeInsets.symmetric(horizontal: 8.0),
                      //         customHeights: _getCustomItemsHeights(),
                      //       ),
                      //       iconStyleData: const IconStyleData(
                      //         openMenuIcon: Icon(Icons.arrow_drop_up),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      ElevatedButton(
                          onPressed: () {
                            signUp(email, password);
                            // print("user " + email + " " + fullname);
                            // print("user " + selectedValue!);
                          },
                          child: Text('SingUp'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 48, 93, 242)))),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have you already account?",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.amber)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        String userId = userCredential.user!.uid; // Get the user ID

        saveData(userId); // Pass the user ID to saveData
      } catch (e) {
        Fluttertoast.showToast(msg: 'e');
      }
    }
  }

  void saveData(String v_user_id) async {
    String resp = await SaveData().SaveDataImage(
      v_user_id: v_user_id, // Pass the user ID here
      email: email,
      password: password,
      firstName: firstName,
      secondName: secondName,
      userRole: userRole,
      city: city,
      storeName: storeName,
      // phoneNumber: phoneNumber,
      selectedValue: selectedValue,
      file: _image!,
    );
    print(email);
    print(firstName);
    print(phoneNumber);
    print(password);
    print(selectedValue);
    print(_image);
    setState(() {
      _loading = true;
    });
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
    Fluttertoast.showToast(msg: "ACCOUNT CREATED");
  }

  // Future<void> signUp(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //    UserCredential userCredential =  (await auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {
  //               // postDetailsToFirestore(),
  //               saveData()
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     })) as UserCredential;
  //   }
  // }

  // void saveData() async {
  //   String resp = await SaveData().SaveDataImage(
  //       email: email,
  //       password: password,
  //       fullname: fullname,
  //       // phoneNumber: phoneNumber,
  //       selectedValue: selectedValue,
  //       file: _image!);
  //   print(email);
  //   print(fullname);
  //   print(phoneNumber);
  //   print(password);
  //   print(selectedValue);
  //   print(_image);
  //   Navigator.push(
  //     context as BuildContext,
  //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //   );
  //   Fluttertoast.showToast(msg: "ACCOUNT CREATED");
  // }
  // postDetailsToFirestore() async {
  //   // Calling Our Firebase Store
  //   // Calling Our User Model
  //   // Sending these Values

  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? users = auth.currentUser;

  //   UserModel userModel = UserModel();

  //   userModel.email = users!.email;
  //   userModel.user_id = users.uid;
  //   userModel.fullname = fullname;
  //   userModel.phoneNumber = phoneNumber;
  //   userModel.password = password;

  //   userModel.user_image = 'file?.path';
  //   userModel.user_role = selectedValue;

  //   print(email);
  //   print(email);
  //   print(fullname);
  //   print(phoneNumber);
  //   print(password);
  //   print(selectedValue);
  //   print(_image);
  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(users.uid)
  //       .set(userModel.toMap());
  //   Navigator.push(
  //     context as BuildContext,
  //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //   );
  //   Fluttertoast.showToast(msg: "ACCOUNT CREATED");
  // }
}
