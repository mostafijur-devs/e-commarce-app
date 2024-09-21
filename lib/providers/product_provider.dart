import 'dart:io';

import 'package:e_commarce_app/db/db_helper.dart';
import 'package:e_commarce_app/models/categoty_model.dart';
import 'package:e_commarce_app/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';



class ProductProvider with ChangeNotifier{

  List<CategoryModel> categoryList = [];

  Future<void> addCategory( String name) {
    final categoryModel = CategoryModel(name);
    return DbHelper.addCategory(categoryModel);
  }
  Future<void> addProduct( ProductModel productModel) {
    return DbHelper.addProduct(productModel);
  }

  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) => CategoryModel.fromMap(snapshot.docs[index].data()),);
      notifyListeners();

    },);
  }
  // upload image in firebase
  Future<String> uploadImageToStroge(String localPath) async {
    final imageName = 'Image${DateTime.now().millisecondsSinceEpoch}';
    final imageRef = FirebaseStorage.instance.ref(imageName).child('images/$localPath');
    final uploadTask = imageRef.putFile(File(localPath));
    final snapshot = await uploadTask.whenComplete(() {},);
    return await snapshot.ref.getDownloadURL();
  }

}