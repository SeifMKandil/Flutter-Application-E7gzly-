import 'package:flutter/material.dart';

import '../widgets/NavBarr.dart';
import '../widgets/card_text.dart';
import '../widgets/categories_scroll.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBarr(),
        backgroundColor: const Color(0xFF212121),
        appBar: AppBar(
          backgroundColor: const Color(0xFF303030),
          title: Text('7ogozat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.8))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard(
                      image: Image.asset("assets/images/foot.jpg",
                          fit: BoxFit.fill),
                      category: "Football"),
                  buildCard(
                      image: Image.asset("assets/images/voley.jpg",
                          fit: BoxFit.fill),
                      category: "Volleyball"),
                  buildCard(
                      image: Image.asset("assets/images/basket.jpg",
                          fit: BoxFit.fill),
                      category: "Basketball"),
                  buildCard(
                      image: Image.asset("assets/images/tennis.jpg",
                          fit: BoxFit.fill),
                      category: "Tennis"),
                  buildCard(
                      image: Image.asset("assets/images/baskett.jpg",
                          fit: BoxFit.fill),
                      category: "Basketball"),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          //SearchBar(),
          SizedBox(
            height: 30,
          ),
          CardText(
            text1: "El Galaa club",
            text: "Masr El Gedida, Salah Salem",
            text0: "Football",
            price: " Price Per Hour: 200 LE",
            image: Image.asset("assets/images/1.jpg", fit: BoxFit.fill),
          ),
          const SizedBox(height: 30),
          CardText(
            text1: "El Lycee School",
            text: "Masr El Gdida, Triumph",
            text0: "Volleyball",
            price: " Price Per Hour: 150 LE",
            image: Image.asset("assets/images/volloey.jpg", fit: BoxFit.fill),
          ),
          const SizedBox(height: 30),
          CardText(
            text1: "El Wafaa Wel Amal",
            text: "Nasr City, Mostafa El Nahas",
            text0: "Padel",
            price: " Price Per Hour: 250 LE",
            image: Image.asset("assets/images/padel(1).jpg", fit: BoxFit.fill),
          )
        ]))));
  }
}
