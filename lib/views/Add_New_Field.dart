import 'package:flutter/material.dart';

class NewField extends StatefulWidget {
  const NewField({Key? key}) : super(key: key);

  @override
  State<NewField> createState() => _NewFieldState();
}

class _NewFieldState extends State<NewField> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 197, 197),
        appBar: AppBar(
          title: const Text('Add New Field'),
          centerTitle: true,
          backgroundColor: Color(0xFF303030),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Container(
                child: SingleChildScrollView(
                  reverse: true,
                  padding: EdgeInsets.all(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "Please Enter Field Data",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 15, 106, 15)),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "Field Name/Number ",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter field name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "Field Location ",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter field Location";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "Field Sport ",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter field Sport";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        cursorColor: Color.fromARGB(255, 15, 106, 15),
                        decoration: InputDecoration(
                            hintText: "Field Price per Hour ",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 15, 106, 15)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Price Per Hour";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Center(
                        child: OutlinedButton(
                          onPressed: (() {
                            if (formKey.currentState!.validate()) {
                              final snackBar = SnackBar(
                                content: Text('Field Saved'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }),
                          child: Text('Save'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 15, 106, 15),
                            side: BorderSide(
                              color: Color.fromARGB(255, 15, 106, 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
