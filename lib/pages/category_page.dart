import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:e_commarce_app/providers/product_provider.dart';
import 'package:e_commarce_app/utils/widgets_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName = '/category';
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {
  String tittle = '';

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showSingleTextInputButton(
          context: context,
          title: 'New Category',
          onSave: (value) async {
            EasyLoading.show(status: 'Please wait....');
            await context.read<ProductProvider>().addCategory(value);
            EasyLoading.dismiss();
            showMassage(context: context, message: "Category save");// addCategory()
          },
        );

      },child: const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Text(tittle)
        ],
      ),
    );
  }
}
