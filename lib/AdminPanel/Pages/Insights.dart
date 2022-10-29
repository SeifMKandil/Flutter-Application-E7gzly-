import 'package:flutter/material.dart';

class Insights extends StatelessWidget{
  const Insights({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      )
    );
  }
}