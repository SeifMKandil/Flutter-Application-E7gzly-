import 'package:e7gzly/widgets/Button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Resveration extends StatelessWidget {
  final String name;
  final String price;
  final String size;
  final String type;
  final String url;
  final String img;

  const Resveration(
      {super.key,
      required this.name,
      required this.price,
      required this.size,
      required this.type,
      required this.url,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          img,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''$name

$price EGP Per Hour''',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 240, 235, 235)),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 11, 11, 11),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 92, 95, 94),
          indent: 50,
          endIndent: 50,
          height: 100,
          thickness: 2,
        ),
        Container(
          height: 100,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''Size

Field type''',
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 244, 246),
                            fontSize: 15)),
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''$size

$type''',
                        style: TextStyle(
                            color: Color.fromARGB(255, 220, 222, 224),
                            fontSize: 15)),
                  ))
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 11, 11, 11),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 92, 95, 94),
          indent: 50,
          endIndent: 50,
          height: 20,
          thickness: 2,
        ),
        Container(
          height: 100,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("About Field",
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 244, 246),
                            fontSize: 20)),
                  )),
            ],
          ),
        ),
        Button(
            button_name: "Book Time Slot",
            onPressed: () {},
            textColor: Colors.white,
            button_color: Colors.green)
      ]),
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
    );
  }
}
/*Align(
                alignment: Alignment.topRight,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 227, 31, 31)),
                      text: "Go To"),
                  TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 62, 16, 214)),
                      text: "Click here",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "https://www.youtube.com";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw "cannt run it";
                          }
                        })
                ])),
              )*/