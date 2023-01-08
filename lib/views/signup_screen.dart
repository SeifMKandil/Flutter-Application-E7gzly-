import 'package:e7gzly/views/business_provider_register_screen.dart';
import 'package:e7gzly/widgets/Button.dart';
import 'package:e7gzly/widgets/Text_Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //  static bool validate(String email,
  //     [bool allowTopLevelDomains = false, bool allowInternational = true]);

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _addressController = TextEditingController();

  Future signUp() async {
    if (passwordsmatch()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
    Navigator.of(context).pushNamed('/');
  }

  bool passwordsmatch() {
    if (_confirmpasswordController.text.trim() ==
        _passwordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _obsecureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          // alignment: MainAxisAlignment.center,
          //alignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                      labelText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      Placeholder: "",
                      hintText: "Email Address",
                      prefixIcon: Icon(Icons.email)),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      labelText: "Username",
                      keyboardType: TextInputType.name,
                      Placeholder: "",
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person)),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      labelText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      Placeholder: "",
                      hintText: "Phone Number",
                      prefixIcon: Icon(Icons.phone)),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      labelText: "Address",
                      keyboardType: TextInputType.text,
                      Placeholder: "",
                      hintText: "Address",
                      prefixIcon: Icon(Icons.location_city)),
                  SizedBox(
                    height: 30,
                  ),
                  CustomPasswordTextField(
                      labelText: "Password",
                      Placeholder: "",
                      isPasswordTextField: true,
                      hintText: "Password"),
                  SizedBox(
                    height: 30,
                  ),
                  CustomPasswordTextField(
                      labelText: "Confirm Password",
                      Placeholder: "",
                      isPasswordTextField: true,
                      hintText: "Confirm Password"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(inputText: "Submit", onPressed: signUp),
                  CustomTextButton(
                      inputText: "Signup as an Admin",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BPRegisterScreen();
                          }),
                        );
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
