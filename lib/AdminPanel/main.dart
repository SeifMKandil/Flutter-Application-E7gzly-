import 'package:flutter/material.dart';
import'package:sports_registration/navigation_drawer.dart';
import 'package:sports_registration/widgets/Admin_Cards.dart';
void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer:const NavigationDraw(),
      appBar: AppBar(
        title: const Text('Admin Panel'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      // ignore: prefer_const_constructors
      body:SingleChildScrollView( child:Center(
       
        child :Container(child:Column(
          
          children: [
            SizedBox(height: 20,), 
            CardText(Time: "1 hours",Field: "8" , price: "300",  registrant: "Saad", ),
          SizedBox(height: 20,),
           CardText(Time: "2 hours",Field: "10" , price: "600",  registrant: "Mohamed", ),
           SizedBox(height: 20,),
            CardText(Time: "3 hours",Field: "1" , price: "900",  registrant: "Marzouk", ),
          SizedBox(height: 20,),
          ]
          ),
        


        ),
      ),),);
      
    
  }
} 
