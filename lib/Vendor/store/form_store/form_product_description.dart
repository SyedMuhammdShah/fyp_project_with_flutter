import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class FormProductDescription extends StatefulWidget {
  const FormProductDescription({super.key});

  @override
  State<FormProductDescription> createState() => _FormProductDescription();
}

class _FormProductDescription extends State<FormProductDescription> {
  final _formKey = GlobalKey<FormState>();
  late SingleValueDropDownController _cnt;

  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
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
                              "Form Product Description",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Printing Methods"),
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

                                hintText: "Heat-transfer Printing",
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
                              height: 15,
                            ),
                            const Text("Place of Origin"),
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
                              height: 15,
                            ),
                            const Text("Brand Name"),
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

                                hintText: "TOMY",
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
                              height: 15,
                            ),
                            const Text("Feature"),
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

                                hintText:
                                    "Anti-wrinkle, QUICK DRY, Compressed, Sustainable, Plus Size",
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
                                          "Model Number",
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

                                            hintText: "R23 H",
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
                                          "Collar",
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

                                            hintText: "O-Neck",
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
                                          "Fabric Weight",
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
                                          "Available Quantity:",
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
                                          "Material",
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

                                            hintText: r"100% Cotton",
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
                                          "Technics",
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

                                            hintText: "Printed",
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
                                          "Sleeve Style",
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

                                            hintText: "Short sleeve",
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
                                          "Gender",
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DropDownTextField(
                                          controller: _cnt,
                                          clearOption: true,
                                          searchDecoration: const InputDecoration(
                                              hintText:
                                                  "enter your custom hint text here"),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Required field";
                                            } else {
                                              return null;
                                            }
                                          },
                                          dropDownItemCount: 6,
                                          dropDownList: const [
                                            DropDownValueModel(
                                                name: 'Male', value: "Male"),
                                            DropDownValueModel(
                                              name: 'Female',
                                              value: "Female",
                                            ),
                                          ],
                                          onChanged: (val) {},
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
                                          "Design",
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

                                            hintText: r"Blank",
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
                                          "Pattern Type",
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

                                            hintText: "Solid",
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
                                          "Style",
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

                                            hintText: r"Vintage",
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
                                          "Fabric Type",
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

                                            hintText: "woven",
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
                                          "Weaving method",
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

                                            hintText: "knitted",
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
                                          "7 days sample order lead time",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DropDownTextField(
                                          controller: _cnt,
                                          clearOption: true,
                                          searchDecoration: const InputDecoration(
                                              hintText:
                                                  "enter your custom hint text here"),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Required field";
                                            } else {
                                              return null;
                                            }
                                          },
                                          dropDownItemCount: 6,
                                          dropDownList: const [
                                            DropDownValueModel(
                                                name: 'Support',
                                                value: "Support"),
                                            DropDownValueModel(
                                              name: 'Not Support',
                                              value: "Not Support",
                                            ),
                                          ],
                                          onChanged: (val) {},
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
