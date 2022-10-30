import 'package:e7gzly/screens/home_page.dart';
import 'package:e7gzly/screens/tes.dart';
import 'package:e7gzly/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:e7gzly/screens/tes.dart';

class CardText extends StatelessWidget {
  final String text;
  final String text0;
  final String price;
  final Image image;

  const CardText(
      {super.key,
      required this.text,
      required this.price,
      required this.image,
      required this.text0});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const tes();
        }));
      },
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.all(Radius.elliptical(35.0, 35.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              )
            ]),
        //sooooooooooooooooooooooooooooooooooooooooooooora
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: image,
              ),
              //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
              SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF5F5F5)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                text0,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.yellow,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
