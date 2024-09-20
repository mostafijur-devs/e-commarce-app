import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(onPressed: () {
            context.read<FirebaseAuthProvider>().logOut();
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Login DashBroad'),
      ),
    );
  }
}
