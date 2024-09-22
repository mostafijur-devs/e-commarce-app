import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_app/models/categoty_model.dart';
import 'package:e_commarce_app/models/product_model.dart';

class DbHelper {
  DbHelper._(); //off the object in class
  static final _db = FirebaseFirestore.instance;
  static const String _collectionAdmin = 'Admins';
  static const String _collectionCategory = 'Categories';
  static const String _collectionProducts = 'Products';

  // get admin login
  static Future<bool> isAdmin(String uid) async {
   final snapshot = await _db.collection(_collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }
  // add category
  static Future<void>addCategory(CategoryModel categoryModel) {
    return _db.collection(_collectionCategory).add(categoryModel.toMap());
  }

  static Future<void>addProduct(ProductModel productModel) {
    final doc = _db.collection(_collectionProducts).doc();
    productModel.id =doc.id;
    return doc.set(productModel.toMap());
  }
  // get all category in database
  static Stream<QuerySnapshot<Map<String, dynamic>>>  getAllCategories() =>
      _db.collection(_collectionCategory).orderBy('name').snapshots();
  static Stream<QuerySnapshot<Map<String, dynamic>>>  getAllProducts() =>
      _db.collection(_collectionProducts).snapshots();

  static Future<void> updateSingleProductField(String id, String field, dynamic value) async {
    await _db.collection(_collectionProducts).doc(id).update({field: value});
  }
}