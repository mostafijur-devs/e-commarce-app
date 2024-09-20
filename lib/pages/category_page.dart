import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName = '/category';
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {
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
      body: const Center(
        child: Text('Login category'),
      ),
    );
  }
}
