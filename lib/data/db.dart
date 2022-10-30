import 'package:flutter/cupertino.dart';

class Data {
  List<Set> FieldDetails = [
    {
      'Feild1',
      'Feild2',
      'Feild3',
      'Feild4',
    },
    {
      '150',
      '200',
      '300',
    },
    {
      'El Galaa',
      'Lycee',
      'El Hars',
      '3alam el ryada',
      '7amza',
    },
  ];

  var db = [];

  void addData() {
    var FeildName = FieldDetails[0];
    var FeildPrice = FieldDetails[1];
    db.add({
      'name': FeildName,
      'id': 2,
    });
  }
}
