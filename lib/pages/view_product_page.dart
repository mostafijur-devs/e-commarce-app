import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProductPage extends StatefulWidget {
  static const String routeName = '/viewproductpage';
  const ViewProductPage({super.key});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}
class _ViewProductPageState extends State<ViewProductPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('View Product'),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Login viewProductPage'),
      ),
    );
  }
}
