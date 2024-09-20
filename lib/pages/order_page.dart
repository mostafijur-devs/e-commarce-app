import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = '/order';
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}
class _OrderPageState extends State<OrderPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text('Login order'),
      ),
    );
  }
}
