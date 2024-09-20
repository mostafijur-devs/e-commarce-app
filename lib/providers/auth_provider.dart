import 'dart:io';

import 'package:e_commarce_app/db/db_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthProvider with ChangeNotifier {

  final _auth =FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  // get massage => null;

  Future<bool> logInAdmin (String email, String password) async{
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return DbHelper.isAdmin(credential.user!.uid);
  }

  Future<void> logOut ()=> _auth.signOut();
}