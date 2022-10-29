import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:e7gzly/data/db.dart';
import 'package:e7gzly/model/records.dart';

import '../widgets/Button.dart';

class Test extends StatefulWidget {
  final Data data;
  const Test({super.key, required this.data});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    data.addData();
    var record = Records.fromMap(data.db[0]);
    return Scaffold(
      body: Center(
        child: Button(
          button_name: "$record",
          textColor: Color(0xffffffff),
          button_color: Color(0x00000000),
          onPressed: () {},
        ),
      ),
    );
  }
}
