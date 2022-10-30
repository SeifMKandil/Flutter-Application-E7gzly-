import 'package:flutter/material.dart';

class Insights extends StatelessWidget{
  const Insights({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: const Text('Insights'),
        centerTitle: true,
        backgroundColor: Color(0xFF303030),
      )
    );
  }
}