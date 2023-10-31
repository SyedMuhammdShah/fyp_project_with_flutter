import 'package:flutter/material.dart';

class CreateStore extends StatefulWidget {
  const CreateStore({super.key});

  @override
  State<CreateStore> createState() => _CreateStoreState();
}

class _CreateStoreState extends State<CreateStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Store Create VEnder"),
      ),
    );
  }
}
