import 'package:flutter/material.dart';

class ApparelCompanies extends StatelessWidget {
  const ApparelCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(
                10), // Optional: Add border radius for a rounded look
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2, // Adjust spread radius as needed
                blurRadius: 5,
                offset: Offset(0, 3), // Adjust shadow offset
              ),
            ],
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/images/product1.png',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
              ),
              Container(
                width: 130,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Discover the Shirt ",
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text(
                            "Short Sleeve",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("Casual Shirt",
                              style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 30,
                      endIndent: 1,
                      color: Color.fromARGB(170, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
