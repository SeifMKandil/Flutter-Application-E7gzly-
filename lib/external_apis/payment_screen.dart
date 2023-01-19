import 'dart:convert';
import 'package:e7gzly/view-models/profile_view_model.dart';
import 'package:e7gzly/view-models/home_view_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'CONSTANTS.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
     return GetBuilder<ProfileViewModel>(
       init: ProfileViewModel(),
      builder: (profileController) =>
          GetBuilder(
         init : HomeViewModel(),
            builder: (fieldController) =>
               Scaffold(
        backgroundColor: const Color(0xFF212121),
        appBar: AppBar(
              backgroundColor: const Color(0xFF212121),
              title: Text("Payment and Details"),
        ),
        body: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text("Location: Placeholder", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic,color: Colors.white),),
        SizedBox(height: 10),
        Text("Time Slot: Placeholder", style: TextStyle(fontSize: 30, color: Colors.white),),
        SizedBox(height: 10),
        Text("Price: 100 EGP", style: TextStyle(fontSize: 30, color: Colors.white),),
              ],
        ),
        bottomNavigationBar: Container(
              color: Colors.green,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                ),
                child: Text("Pay Now!"),
                onPressed: ()async{
                 await  makePayment();
                  await createReservation(profileController.userModel.email!, "1","1",fieldController.getFieldDetails().location!);

                },
              ),
        ),
      ),
          ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('100', 'EGP');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();

    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
      ).then((value){
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successful"),
                    ],
                  ),
                ],
              ),
            ),
        );
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }



  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100 ;
    return calculatedAmount.toString();
  }

  createReservation(String reservedBy, String day, String time, String fieldName) async {
    final docReservation = FirebaseFirestore.instance.collection("Reservations").doc();

    final json = {
      'timeSlot' : time,
      'fieldName' : fieldName,
      'day' : day,
      'reservedBy' : reservedBy,

    };

     await docReservation.set(json);
  }




}