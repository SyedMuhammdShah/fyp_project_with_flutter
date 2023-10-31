import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:advance_image_picker/advance_image_picker.dart';

import '../../../widgets/pickImage.dart';

class FormProductBasicInfo extends StatefulWidget {
  const FormProductBasicInfo({super.key});

  @override
  State<FormProductBasicInfo> createState() => _FormProductBasicInfoState();
}

class _FormProductBasicInfoState extends State<FormProductBasicInfo> {
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
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
        appBar: AppBar(),
        body: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  // Background Image
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Product Basic Info",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _image != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(_image!))),
                                        )
                                      : Container(
                                          child: Image.network(
                                              "https://as2.ftcdn.net/v2/jpg/04/28/76/95/1000_F_428769564_NB2T4JM9E2xsxFdXXwqW717HwgaZdpAq.jpg"),
                                        )
                                  // _image != null
                                  //     ? CircleAvatar(
                                  //         backgroundImage: MemoryImage(_image!),
                                  //       )
                                  //     : const CircleAvatar(
                                  //         backgroundImage: NetworkImage(
                                  //             "assets/images/user_logo.png"),
                                  //       ),
                                ],
                              ),
                            ),
                            const Text("Product Title"),
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

                                hintText: "Half Polo T-Shirt",
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  //email = value;
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
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "Price Range",
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
                                            fillColor: Color.fromARGB(
                                                68, 217, 216, 218),
                                            // border: UnderlineInputBorder(),

                                            hintText: r"10 $",
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              //  firstName = value;
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "Min Order",
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
                                            fillColor: Color.fromARGB(
                                                68, 217, 216, 218),
                                            // border: UnderlineInputBorder(),

                                            hintText: "10 - 40",
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              // secondName = value;
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
                            const Text("Add Product Types"),
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

                                hintText: "T-Shirt with Black and Blue Colors",
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  //email = value;
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
                            const Text("Size"),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomCheckBoxGroup(
                              buttonTextStyle: const ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.orange,
                                textStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                selectedTextStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              autoWidth: false,
                              wrapAlignment: WrapAlignment.center,
                              unSelectedColor: Theme.of(context).canvasColor,
                              buttonLables: [
                                "S",
                                "M",
                                "L",
                                "XL",
                                "XXL",
                              ],
                              disabledValues: [
                                "",
                              ],
                              buttonValuesList: [
                                "Small",
                                "Medium",
                                "Large",
                                "Extra Large",
                                "Extra Extra Large",
                              ],
                              checkBoxButtonValues: (values) {
                                print(values);
                              },
                              spacing: 0,
                              defaultSelected: ["Monday"],
                              horizontal: false,
                              enableButtonWrap: false,
                              width: 70,
                              absoluteZeroSpacing: false,
                              selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                              padding: 6,
                              // enableShape: true,
                            ),

                            SizedBox(height: 10),
                            const Text("Banner Image"),
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Select Main Image',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Positioned(
                                        child: IconButton(
                                          onPressed: selectImage,
                                          icon: const Icon(
                                              Icons.add_a_photo_outlined),
                                          color: Colors.black,
                                        ),
                                        left: -10,
                                        // right: -10,
                                      ),
                                      Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),

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
                                onPressed: () {},
                                child: Text('Click'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 48, 93, 242)))),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
