import 'package:e_commarce_app/pages/dashboard_page.dart';
import 'package:e_commarce_app/pages/login_page.dart';
import 'package:e_commarce_app/pages/luancher_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:e_commarce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FirebaseAuthProvider(),),
      ChangeNotifierProvider(create: (context) => ProductProvider(),)
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LuancherPage.routeName,
      routes: {
        LuancherPage.routeName :(context) => const LuancherPage(),
        LoginPage.routeName : (context) => const LoginPage(),
        DashboardPage.routeName : (context) => const DashboardPage(),
      },
    );
  }
}
