import 'package:cloud_firestore/cloud_firestore.dart';

class DbHelper {
  DbHelper._(); //off the object in class
  static final _db = FirebaseFirestore.instance;
  static const String _collectionAdmin = 'Admins';

  static Future<bool> isAdmin(String uid) async {
   final snapshot = await _db.collection(_collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }
}