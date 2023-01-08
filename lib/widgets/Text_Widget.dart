import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextField(
    String labelText, String Placeholder, bool isPasswordTextField) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
        obscureText: isPasswordTextField ? true : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                    onPressed: () {},
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: Placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87))),
  );
}

class CustomPasswordTextField extends StatelessWidget {
  final String labelText;
  final String Placeholder;
  final bool isPasswordTextField;
  final String hintText;

  const CustomPasswordTextField(
      {required this.labelText,
      required this.Placeholder,
      required this.isPasswordTextField,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(Icons.password),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
              isPasswordTextField ? Icons.visibility : Icons.visibility_off),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 255, 193, 7)),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 236, 236),
      ),
      obscureText: isPasswordTextField,
      onChanged: (String value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String Placeholder;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final String hintText;

  const CustomTextField(
      {required this.labelText,
      required this.keyboardType,
      required this.Placeholder,
      required this.hintText,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly,
      //   LengthLimitingTextInputFormatter(19)
      // ],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 255, 193, 7)),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 236, 236),
      ),
      onChanged: (String value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
