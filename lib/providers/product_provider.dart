import 'package:e_commarce_app/db/db_helper.dart';
import 'package:e_commarce_app/models/categoty_model.dart';
import 'package:flutter/foundation.dart';



class ProductProvider with ChangeNotifier{

  List<CategoryModel> categoryList = [];

  Future<void> addCategory( String name) {
    final categoryModel = CategoryModel(name);
    return DbHelper.addCategory(categoryModel);
  }

  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) => CategoryModel.fromMap(snapshot.docs[index].data()),);
      notifyListeners();

    },);
  }

}