import 'package:e7gzly/main.dart';
import 'package:e7gzly/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../view-models/user_viewmodel.dart';
import '../widgets/Button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification notification = message.notification!;
      AndroidNotification? android = message.notification!.android;

      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,

              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            )
          )
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print("A new onMessageOpenedApp event was published!");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if(notification != null && android != null){
        showDialog(context: context, builder: (_) {
          return AlertDialog(
            title: Text(notification.title!),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body!)
                ],
              ),
            ),
          );
        });
      }

    });

  }

  void showNotification(){
    flutterLocalNotificationsPlugin.show(
      0,
      "Testing Notification",
      "You are on the sign in screen",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.high,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher'
        )
      )
    );
  }

  Future signIn() async {
    showNotification();

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          //Image.asset('assets/images/logo.png'),
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                      fillColor: Color.fromARGB(255, 243, 236, 236),
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
                    onPressed: signIn,
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
