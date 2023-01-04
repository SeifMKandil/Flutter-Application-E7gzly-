/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseDatabase _database;

  UserRepository(this._database);

  Future<void> updateUser(User? user) async {
    await _database.ref().child('users').child(user!.id).set(user.toJson());
  }
}
*/