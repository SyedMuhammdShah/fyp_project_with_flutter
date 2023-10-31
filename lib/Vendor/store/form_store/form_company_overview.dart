import 'dart:typed_data';

import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../widgets/pickImage.dart';

class FormCompanyOverview extends StatefulWidget {
  const FormCompanyOverview({super.key});

  @override
  State<FormCompanyOverview> createState() => _FormCompanyOverviewState();
}

class _FormCompanyOverviewState extends State<FormCompanyOverview> {
  Uint8List? _imageCompanyImage;
  Uint8List? _imageCertification;
  Uint8List? _imageProductCertification;
  Uint8List? _imagePatents;
  Uint8List? _imageTrademark;
  final _formKey = GlobalKey<FormState>();
  void selectImage() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imageCompanyImage = img;
    });

    // ImagePicker imagePicker = ImagePicker();
    // // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print("image" + '${file?.path}');
  }

  void _SelectImageCertification() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imageCertification = img;
    });
  }

  void _SelectImageProductCertification() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imageProductCertification = img;
    });
  }

  void _SelectImagePatents() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imagePatents = img;
    });
  }

  void _SelectImageTrademark() async {
    final _firebaseStorage = FirebaseStorage.instance;

    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imageTrademark = img;
    });
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
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Form Company OverView",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Company Name"),
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

                                hintText: "ABC industry",
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
                            const Text("Country/Region"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: CSCPicker(
                                layout: Layout.horizontal,
                                //flagState: CountryFlag.DISABLE,
                                onCountryChanged: (country) {},
                                onStateChanged: (state) {},
                                /* countryDropdownLabel: "*Country",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",*/
                                //dropdownDialogRadius: 30,
                                //searchBarRadius: 30,
                              ),
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
                                          "Business type",
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

                                            hintText: "Custom manufacturer",
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
                                          "Main Products",
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

                                            hintText: "Men’s Shirt",
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
                                          "Total employees",
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

                                            hintText: "200 Grams",
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
                                          "Total Annual Revenue",
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

                                            hintText: "9999",
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
                                          "Year established",
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

                                            hintText: "Shirt",
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
                                          "Major Clients",
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

                                            hintText: "Half Sleeve",
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
                            const Text("Company Album"),
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
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _imageCompanyImage != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      _imageCompanyImage!))),
                                        )
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                              "https://icons.veryicon.com/png/o/miscellaneous/user-interface-flat-multicolor/5725-select-image.png"),
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Certifications"),
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
                                          onPressed: _SelectImageCertification,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _imageCertification != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      _imageCertification!))),
                                        )
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                              "https://icons.veryicon.com/png/o/miscellaneous/user-interface-flat-multicolor/5725-select-image.png"),
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Product Certifications"),
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
                                          onPressed:
                                              _SelectImageProductCertification,
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
                            Container(
                              child: Column(
                                children: [
                                  _imageProductCertification != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      _imageProductCertification!))),
                                        )
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                              "https://icons.veryicon.com/png/o/miscellaneous/user-interface-flat-multicolor/5725-select-image.png"),
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
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Patents"),
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
                                          onPressed: _SelectImagePatents,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _imagePatents != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      _imagePatents!))),
                                        )
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                              "https://icons.veryicon.com/png/o/miscellaneous/user-interface-flat-multicolor/5725-select-image.png"),
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Trademarks"),
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
                                          onPressed: _SelectImageTrademark,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _imageTrademark != null
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      _imageTrademark!))),
                                        )
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                              "https://icons.veryicon.com/png/o/miscellaneous/user-interface-flat-multicolor/5725-select-image.png"),
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
