import 'package:e7gzly/views/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e7gzly/widgets/card_text.dart';
import 'package:e7gzly/widgets/NavBar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SettingsScreen(),
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          backgroundColor: Color(0xFF303030),
          title: Text('7ogozat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.8))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
                child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10.0, bottom: 10),
                  filled: true,
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
            )),
          ),
          SizedBox(
            height: 30,
          ),

          //Logout Button

          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.amber,
            child: Text(user.email!),
          ),

          //cardDisplay(),
          CardText(
              image: Image.asset("assets/images/1.jpg"),
              price: "One hour Price: 200",
              text0: "Football",
              text: "El Galaa Club"),

          SizedBox(
            height: 30,
          ),
          CardText(
              image: Image.asset("assets/images/volloey.jpg"),
              price: "One hour Price: 300",
              text0: "Volley",
              text: "El Wafaa Wel Amal"),

          SizedBox(
            height: 30,
          ),
          CardText(
              image: Image.asset("assets/images/2.jpeg"),
              price: "One hour Price: 300",
              text0: "Football",
              text: "El Haras"),

          SizedBox(
            height: 30,
          ),
          CardText(
              image: Image.asset("assets/images/basketball.jpg"),
              price: "One hour Price: 300",
              text0: "Basketball",
              text: "Wadi Degla"),
        ]))));
  }
}

/*void Function(String placeName, int price, int pitchNumber) {
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

cardDisplay() {
  for (var i = 0; i < 10; i++) {
    var card = CardText(
        image: Image.asset("assets/images/1.jpg"),
        price: "One hour price: 200",
        text0: "padel",
        text: "El Galaa Club");
    return card;
  }
}*/
