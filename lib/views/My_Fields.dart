import 'package:flutter/material.dart';
import 'package:sports_registration/widgets/Fields_Cards.dart';

class MyFields extends StatelessWidget {
  const MyFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: const Text('Fields'),
        centerTitle: true,
        backgroundColor: Color(0xFF303030),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              CardText(
                Field: '1',
                price: '200',
                place: 'nasr city',
              ),
              SizedBox(
                height: 20,
              ),
              CardText(
                Field: '5',
                place: 'new cairo',
                price: '300',
              ),
              SizedBox(
                height: 20,
              ),
              CardText(
                Field: '6',
                place: 'shubra',
                price: '100',
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
