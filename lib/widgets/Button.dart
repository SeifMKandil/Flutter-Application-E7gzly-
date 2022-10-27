import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  final String button_name;
  final VoidCallback onPressed;
  final Color textColor;
  final Color button_color;

  const Button(
      {super.key,
      required this.button_name,
      required this.onPressed,
      required this.textColor,
      required this.button_color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          button_name,
          style: TextStyle(color: textColor, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: button_color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPrimary: Colors.amber,
        ),
      ),
    );
  }
}
