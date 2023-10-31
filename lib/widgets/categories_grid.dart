import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/object.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 237,
                      238), // Change this to your desired background color
                  borderRadius: BorderRadius.circular(
                      10.0), // Optional: Add rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(96, 158, 158, 158)
                          .withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 1), // Offset in the x and y directions
                    ),
                  ],
                ),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/catApp1.jpg",
                      height: 100,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Apparels",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 237,
                      238), // Change this to your desired background color
                  borderRadius: BorderRadius.circular(
                      10.0), // Optional: Add rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in the x and y directions
                    ),
                  ],
                ),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/yarnsCat.jpg",
                      height: 100,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Yarns",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 237,
                        238), // Change this to your desired background color
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: Add rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset:
                            Offset(0, 3), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/facCat.jpg",
                        height: 100,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Fabrics",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 237,
                        238), // Change this to your desired background color
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: Add rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset:
                            Offset(0, 3), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/trimsCat.png",
                        height: 100,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "trims",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 237,
                  238), // Change this to your desired background color
              borderRadius:
                  BorderRadius.circular(10.0), // Optional: Add rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset in the x and y directions
                ),
              ],
            ),
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/image1.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Get Your \nNew Deals\nWith Us!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
