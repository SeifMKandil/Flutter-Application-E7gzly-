import 'package:flutter/material.dart';
import 'package:home/card_text.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          backgroundColor: Color(0xFF303030),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white.withOpacity(0.8),),
          title: Text('7ogozat',
              style: TextStyle(fontWeight:FontWeight.bold, color: Colors.white.withOpacity(0.8))),
        ),
        body:SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
              SizedBox(height: 20,),
                Center(
                      child: Container(
                          child: SizedBox(
                            width: 300,
                            child:TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 10.0, bottom: 10),
                                filled:true,
                                fillColor: Color(0xFFF5F5F5),
                                hintText: 'Search',
                                prefixIcon: const Icon(Icons.search),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                ),
                      SizedBox(height: 30),
                      CardText(text: "El Galaa Club",text0: "Football",price: " One hour price: 200",image: Image.asset("images/1.jpg"),),
                      SizedBox(height: 30),
                      CardText(text:"El Lycee School",text0: "Volleyball", price:" One hour Price: 150",image: Image.asset("images/volloey.jpg"),),
                      SizedBox(height: 30),
                      CardText(text:"El Wafaa Wel Amal", text0: "Padel",price:" One hour Price: 250",image: Image.asset("images/padel(1).jpg"),)

                    ]
                )
            )
        )

    );
  }
}







void  Function(String placeName, int price,int pitchNumber) {
Scaffold(
body: Center(
  child: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(25),
    ),
  ),
),
    );





}
