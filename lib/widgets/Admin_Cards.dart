import 'package:flutter/material.dart';



class CardText extends StatelessWidget {
  
  final String Time;
  final String Field;
  final String price;
  final String registrant;

  const CardText({super.key, required this.Time,required this.Field, required this.price, required this.registrant});

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Container(
    width: 300,
    height: 350,
    decoration: BoxDecoration(
    color: Color(0xFF212121),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
    offset: Offset(0,3),
    )
    ]
    ),
    //sooooooooooooooooooooooooooooooooooooooooooooora
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
    children:<Widget> [
    SizedBox(height: 50,),
    
    //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
    SizedBox(height: 5,),
    Text(
    'Registration Details', style: TextStyle(fontSize: 23,fontWeight:FontWeight.bold, color: Color.fromARGB(255, 174, 236, 19)),
    ),
    SizedBox(height: 20,),
    Text(
    "Registrant Name : "+registrant, style: TextStyle(fontSize: 23,fontWeight:FontWeight.bold, color: Color(0xFFF5F5F5)),
    ),
    SizedBox(height: 10,),
      Text(
        "Registered Field Number : " + Field, style: TextStyle(fontSize: 15,fontWeight:FontWeight.normal, color: Colors.yellow,fontStyle: FontStyle.italic),
      ),
      SizedBox(height: 10,),
      Text(
        "Time Booked : " + Time, style: TextStyle(fontSize: 15,fontWeight:FontWeight.normal, color: Color(0xFFF5F5F5),fontStyle: FontStyle.italic),
      ),
      SizedBox(height: 10,),
      Text(
        "Price to be paid : " + price, style: TextStyle(fontSize: 15,fontWeight:FontWeight.normal, color: Color(0xFFF5F5F5),fontStyle: FontStyle.italic),
      ),
      SizedBox(height: 10,),
      
      Row(
        children:[
          Padding(padding: EdgeInsets.all(35.0),),
    FloatingActionButton(onPressed: (){},
    child: Text('Accept'),
    backgroundColor: Color.fromARGB(255, 20, 137, 24),),
    SizedBox(width: 30,),
    FloatingActionButton(onPressed: (){},
    child: Text('Decline'),
    backgroundColor: Color.fromARGB(255, 193, 39, 28),),
        ],
    ),
      
    ],
    
    ),
    ),
    
    ),

    );
  }
}
