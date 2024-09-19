import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/dashboard_page.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LuancherPage extends StatefulWidget {
  static const String routeName = '/';
  const LuancherPage({super.key});

  @override
  State<LuancherPage> createState() => _LuancherPageState();
}
class _LuancherPageState extends State<LuancherPage> {
  @override
  void didChangeDependencies() {
    final authProvider = context.read<FirebaseAuthProvider>();
    Future.delayed(const Duration(seconds: 0),() {
      if(authProvider.currentUser != null){
        Navigator.pushReplacementNamed(context, DashboardPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    },);

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
