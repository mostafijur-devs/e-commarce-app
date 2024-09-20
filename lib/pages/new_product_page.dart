import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName = '/product';
  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}
class _NewProductPageState extends State<NewProductPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Login new product page'),
      ),
    );
  }
}
