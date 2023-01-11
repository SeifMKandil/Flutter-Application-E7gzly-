import 'package:e7gzly/models/user_model.dart';
import 'package:e7gzly/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _gooleSignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;
  late int number;

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleuser = await _gooleSignin.signIn();
    print("ahmed");
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleuser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user?.uid,
        email: user.user?.email,
        name: user.user?.displayName,
        pic: '',
        number: null,
      ));
    });
  }

  void signInwithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while creating account", e.message.toString(),
          colorText: Color(15), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void creatAccountwithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: user.user?.displayName,
          pic: '',
          number: number,
        ));
      });

      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while creating account", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
