import 'package:e7gzly/views/signin_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Image.asset('assets/images/logo.png'),
          //Text('Splash Screen',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //  )),
        ),
      ),
    );
  }
}
