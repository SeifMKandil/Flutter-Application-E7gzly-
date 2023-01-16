import 'package:e7gzly/models/user_model.dart';
import 'package:e7gzly/views/control_view.dart';
import 'package:e7gzly/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helpers/local_storage.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _gooleSignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;
  late int number;
  final LocalStorageData localStorageData = Get.find();

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value!.email;
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
      setUser(UserModel(
        userId: user.user?.uid,
        email: user.user?.email,
        name: user.user?.displayName,
        pic: '',
        number: null,
      ));
      Get.offAll(ControlView());
    });
  }

  void signInwithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) async {
        try {
          await FireStoreUser().getCurrentUser(value.user!.uid).then((value) =>
              {
                setUser(
                    UserModel.fromJson(value.data() as Map<dynamic, dynamic>))
              });
        } catch (e) {
          print(e);
        }
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(password);
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
          name: name,
          pic: '',
          number: number,
        ));
        setUser(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: user.user?.displayName,
          pic: '',
          number: null,
        ));
      });

      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while creating account", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
