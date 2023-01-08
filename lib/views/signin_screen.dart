import 'package:e7gzly/views/signup_screen.dart';
import 'package:e7gzly/widgets/Text_Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view-models/user_viewmodel.dart';
import '../widgets/Button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    Navigator.of(context).pushNamed('/');
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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          //Image.asset('assets/images/logo.png'),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // if (!isKeyboard) Image.asset('assets/images/logo.png'),
                  Image.asset('assets/images/logo.png'),
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
                  CustomPasswordTextField(
                      labelText: "Password",
                      Placeholder: "",
                      isPasswordTextField: true,
                      hintText: "Password"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(inputText: "Login", onPressed: signIn),
                  CustomTextButton(
                      onPressed: () {}, inputText: "Forgot your password?"),
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.underline, // <-- SEE HERE
                    ),
                  ),
                  CustomTextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }),
                        );
                      },
                      inputText: "Click here to Signup"),

                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),

                  SignInButton(
                    Buttons.Facebook,
                    text: "Sign up with Facebook",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
