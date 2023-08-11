import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: Stack(
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
                    Image.asset(
                      'assets/images/sv_logo.png',
                      width: 200,
                      height: 100,
                    ),
                    // Email Field
                    SizedBox(
                      height: 20,
                    ),
                    Text("Email"),
                    SizedBox(
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
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email!");
                        }
                        // reg expression
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Password"),
                    SizedBox(
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
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email!");
                        }
                        // reg expression
                      },
                    ),
                    SizedBox(height: 5),
                    // Animated Login Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: -10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CheckboxExample(),
                              Text(
                                "Remember me",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Forgot Password ?",
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),

                    ElevatedButton(
                        onPressed: () {},
                        child: Text('Login'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 48, 93, 242)))),
                    SizedBox(height: 5),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        width: 40,
                        height: 40,
                      ),
                      label: Text("Sign in with Google"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(122, 48, 93, 242))),
                      //borderRadius: BorderRadius.circular(25),
                    ),
                    SizedBox(height: 5),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/facebook_logo.png',
                        width: 30,
                        height: 40,
                      ),
                      label: Text("Sign in with Facebook"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(122, 48, 93, 242))),
                      //borderRadius: BorderRadius.circular(25),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You don't have an account yet?",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Sign up",
                            style:
                                TextStyle(fontSize: 13, color: Colors.amber)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}