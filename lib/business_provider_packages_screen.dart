import 'package:flutter/material.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(),
        body: Column(
          children: [
            SizedBox(height: 120),
            Text("Subscribe Packages",
                style: TextStyle(fontSize: 34, color: Colors.white)),
            Row(mainAxisAlignment: MainAxisAlignment.center),
            SizedBox(height: 30),

            Container(child: Text("Package 1" , style: TextStyle(fontSize: 35 , color: Colors.white)),
            color: Colors.grey,
              width: 300,
              height: 50,
              padding: EdgeInsets.only(left:65),
            ),
            SizedBox(height: 0),
            Container(child: Text("100 EGP          per month", style: TextStyle(fontSize: 30, color: Colors.white)),
              height: 120,
              width:300,
              padding: EdgeInsets.only(left:75, top: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.lightGreenAccent,
                    width: 3,
                  )),


            ),


            SizedBox(height: 30),

            Container(child: Text("Package 2" , style: TextStyle(fontSize: 35 , color: Colors.white)),
              color: Colors.grey,
              width: 300,
              height: 50,
              padding: EdgeInsets.only(left:65),
            ),
            SizedBox(height: 0),
            Container(child: Text("250 EGP          per month", style: TextStyle(fontSize: 30, color: Colors.white)),
              height: 120,
              width:300,
              padding: EdgeInsets.only(left:75, top: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.lightGreenAccent,
                    width: 3,
                  )),


            )

            ,
            SizedBox(height: 30),

            Container(child: Text("Package 3" , style: TextStyle(fontSize: 35 , color: Colors.white)),
              color: Colors.grey,
              width: 300,
              height: 50,
              padding: EdgeInsets.only(left:65),
            ),
            SizedBox(height: 0),
            Container(child: Text("999 EGP          per year", style: TextStyle(fontSize: 30, color: Colors.white)),
              height: 120,
              width:300,
              padding: EdgeInsets.only(left:75, top: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.lightGreenAccent,
                    width: 3,
                  )),


            ) //PASTE HERE!!
          ],


        )

    );
  }











}
