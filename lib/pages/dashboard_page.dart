import 'package:e_commarce_app/customswidgets/dashborad_item_view.dart';
import 'package:e_commarce_app/models/dashborad_model.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:e_commarce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductProvider>().getAllCategories();
    context.read<ProductProvider>().getAllProducts();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<FirebaseAuthProvider>().logOut();
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,

          ),
          itemBuilder: (context, index) {
            final item = dashboradItem[index];
            return DashboradItemView(model: item);
          },
          itemCount: dashboradItem.length,
        ));
  }
}
