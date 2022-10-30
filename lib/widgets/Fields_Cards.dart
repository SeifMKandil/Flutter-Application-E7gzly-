import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String place;
  final String Field;
  final String price;

  const CardText(
      {super.key,
      required this.place,
      required this.Field,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        height: 260,
        decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.circular(15),
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
                height: 50,
              ),

              //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
              SizedBox(
                height: 5,
              ),
              Text(
                'Field Information',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 174, 236, 19)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Place : " + place,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 54, 164, 26),
                    fontStyle: FontStyle.italic),
              ),

              Text(
                "Field Number : " + Field,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 132, 120, 16),
                    fontStyle: FontStyle.italic),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Price per hour : " + price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(96, 20, 30, 0),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Text('Delete'),
                    backgroundColor: Color.fromARGB(255, 193, 39, 28),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
