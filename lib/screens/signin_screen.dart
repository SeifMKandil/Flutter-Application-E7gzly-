import 'package:e7gzly/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/Button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obsecureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          // Image.asset('assets/images/logo.png'),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  if (!isKeyboard) Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        child: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 212, 212, 80)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 195, 186, 186),
                    ),
                    obscureText: _obsecureText,
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      //<-- SEE HERE
                      backgroundColor: Color.fromARGB(255, 212, 212, 80),
                      side: BorderSide(
                        width: 3.0,
                        color: Color.fromARGB(255, 212, 212, 80),
                      ),
                    ),
                    child: Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      //<-- SEE HERE
                      side: BorderSide(width: 3.0),
                    ),
                    child: Text('Forgot your password?'),
                  ),
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.underline, // <-- SEE HERE
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }),
                      );
                    },
                    style: TextButton.styleFrom(
                      //<-- SEE HERE
                      side: BorderSide(width: 3.0),
                    ),
                    child: Text('Click here to Signup'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
