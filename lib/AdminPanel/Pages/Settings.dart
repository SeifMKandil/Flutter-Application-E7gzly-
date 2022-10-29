import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  const Settings({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      )
    );
  }
}