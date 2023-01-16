import 'package:e7gzly/views/auth.dart';
import 'package:e7gzly/views/control_view.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'helpers/bindings.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51M30wnG5FKQlBCQ1QMLmIfNFuIgd8jcZndZrts5d66J7Uned0HRxN90lhlM7582cMfXKl84WNJGLZolVXKUgKacQ00HNMZ1cEc";
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControlView(),
    );
  }
}
